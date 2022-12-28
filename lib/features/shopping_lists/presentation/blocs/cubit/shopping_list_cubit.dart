import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/get_all_shopping_lists_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/rename_shopping_list_usecase.dart';

import '../../../../../core/widgets/custom_dialog.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  final RenameShoppingListUseCase renameShoppingListUseCase;
  final GetAllShoppingListsUseCase getAllShoppingListsUseCase;
  ShoppingListCubit(
      {required this.renameShoppingListUseCase,
      required this.getAllShoppingListsUseCase})
      : super(const ShoppingListState());

  void getAllShoppingList() async {
    final response = await getAllShoppingListsUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          shoppingListRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    },
        (shoppingList) => emit(state.copyWith(
            shoppingListRequestState: RequestState.loaded,
            shoppingLists: shoppingList)));
  }
}
