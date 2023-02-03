import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/utils/sort_prices_map.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/price_model.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list_store.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/rename_shopping_list_usecase.dart';

import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../cart/domain/entities/cart_item.dart';
import '../../../../domain/entities/shopping_list.dart';

part 'shopping_list_details_state.dart';

class ShoppingListDetailsCubit extends Cubit<ShoppingListDetailsState> {
  final RenameShoppingListUseCase renameShoppingListUseCase;
  ShoppingListDetailsCubit({required this.renameShoppingListUseCase})
      : super(const ShoppingListDetailsState());

  void setShoppingListName(String name) =>
      emit(state.copyWith(shoppingListName: name));

  void renameShoppingList(
      {required ShoppingList shoppingList, required String name}) {
    Get.back();
    final oldName = shoppingList.name; // used as key for local storage
    ShoppingList renamedShoppingList = shoppingList.copyWith(name: name);

    final response = renameShoppingListUseCase(RenameShoppingListParams(
        shoppingList: renamedShoppingList, key: oldName));

    response.fold(
        (failure) => yaBalashCustomDialog(
              buttonTitle: 'حسنا',
              isWithEmoji: false,
              title: 'خطأ',
              mainContent: failure.message,
              onConfirm: () => Get.back(),
            ), (success) {
      emit(state.copyWith(shoppingListName: name));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'ملاحظة',
        mainContent: 'تم تغيير الاسم بنجاح',
        onConfirm: () => Get.back(),
      );
    });
  }

  void getShoppingListStores({required List<CartItem> shoppingListItems}) {
    List<ShoppingListStoreModel> stores = [];

    Map<String, List<CartItem>> storesMap = {};
    // sort items prices
    final sortedPrices = shoppingListItems.map((item) {
      Map<String, PriceModel> sortedPrices =
          sortProductPrices(item.product!.prices!); // sort each product prices
      return CartItem(
          product: item.product!.copyWith(prices: sortedPrices),
          quantity: item.quantity);
    }).toList();

    for (var element in sortedPrices) {
      if (element.product!.prices!.isNotEmpty) {
        String storeImagePath = element.product!.prices!.entries.first.value
            .storeImagePath!; //chepeast store for current item
        if (storesMap.containsKey(storeImagePath)) {
          storesMap.update(
              storeImagePath,
              (value) =>
                  value..add(element)); // add cart item to corresponding store
        } else {
          storesMap[storeImagePath] = [element];
        }
      }
    }

    double storesSubTotal = 0;
    double saving = 0;
    for (var storeEntry in storesMap.entries) {
      double subTotal = 0;

      for (var item in storeEntry.value) {
        subTotal +=
            (item.quantity! * item.product!.prices!.entries.first.value.price!);
        saving += item.quantity! *
            (item.product!.prices!.entries.last.value.price! -
                item.product!.prices!.entries.first.value.price!);
      }
      storesSubTotal += subTotal;
      stores.add(ShoppingListStoreModel(
          items: storeEntry.value,
          storeImagePath: storeEntry.key,
          totalPrice: subTotal.round()));
    }

    emit(state.copyWith(
        stores: stores,
        subTotal: storesSubTotal,
        saving: saving.round(),
        storesState: RequestState.loaded));
  }
}
