import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list_store.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/rename_shopping_list_usecase.dart';

import '../../../../../../core/widgets/custom_dialog.dart';
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
}
