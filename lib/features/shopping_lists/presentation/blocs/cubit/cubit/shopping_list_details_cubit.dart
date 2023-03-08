import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/usecases/get_product_details_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list_store.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/rename_shopping_list_usecase.dart';

import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../cart/domain/entities/cart_item.dart';
import '../../../../domain/entities/shopping_list.dart';

part 'shopping_list_details_state.dart';

class ShoppingListDetailsCubit extends Cubit<ShoppingListDetailsState> {
  final RenameShoppingListUseCase renameShoppingListUseCase;
  final GetProductDetailsUseCase getProductDetailsUseCase;
  ShoppingListDetailsCubit({
    required this.renameShoppingListUseCase,
    required this.getProductDetailsUseCase,
  }) : super(const ShoppingListDetailsState());

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

  Future<List<CartItem>> getShoppingListProductDetails(
      List<CartItem> shoppingListItems) async {
    List<CartItem> products = List<CartItem>.empty(growable: true);

    for (var element in shoppingListItems) {
      final response = await getProductDetailsUseCase(GetProductDetailsParams(
          withNearStores: true, productId: element.product!.id!));

      response.fold(
          (failure) => emit(state.copyWith(
              errorMessage: failure.message,
              storesState: RequestState.error)), (product) {
        products.add(element.copyWith(product: product));
      });
    }

    return products;
  }

  void getShoppingListStores(
      {required List<CartItem> shoppingListItems}) async {
    final products = await getShoppingListProductDetails(shoppingListItems);
    List<ShoppingListStoreModel> stores =
        List<ShoppingListStoreModel>.empty(growable: true);

    Map<String, List<CartItem>> storesCartItems = {};

    for (var element in products) {
      if (element.product!.prices!.isNotEmpty) {
        String storeImagePath = element.product!.prices!.entries.first.value
            .storeImagePath!; //chepeast store for current item
        if (storesCartItems.containsKey(storeImagePath)) {
          storesCartItems.update(
              storeImagePath,
              (value) =>
                  value..add(element)); // add cart item to corresponding store
        } else {
          storesCartItems[storeImagePath] = [element];
        }
      }
    }

    final storesSubTotal = _calculateStoresSubTotal(stores, storesCartItems);

    emit(state.copyWith(
        stores: stores,
        subTotal: storesSubTotal['subTotal'],
        saving: storesSubTotal['saving']!.round(),
        storesState: RequestState.loaded));
  }
}

Map<String, double> _calculateStoresSubTotal(
    List<ShoppingListStoreModel> stores,
    Map<String, List<CartItem>> storesCartItems) {
  double storesSubTotal = 0;
  double saving = 0;

  // Iterate through each store in storesMap
  for (final storeEntry in storesCartItems.entries) {
    double subTotal = 0;

    // Iterate through each item in the current store
    for (final item in storeEntry.value) {
      // Calculate the subtotal for the current item and add it to the store subtotal
      subTotal +=
          (item.quantity! * item.product!.prices!.entries.first.value.price!);

      // Calculate the saving for the current item and add it to the total saving
      saving += item.quantity! *
          (item.product!.prices!.entries.last.value.price! -
              item.product!.prices!.entries.first.value.price!);
    }

    // Add the store information to the stores list
    stores.add(
      ShoppingListStoreModel(
        items: storeEntry.value,
        storeImagePath: storeEntry.key,
        totalPrice: subTotal.round(),
      ),
    );

    // Add the store subtotal to the total stores subtotal
    storesSubTotal += subTotal;
  }

  return {'subTotal': storesSubTotal, 'saving': saving};
}
