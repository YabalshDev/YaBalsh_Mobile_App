import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/utils/extensions/list_limit_extension.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_all_brands_usecase.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_all_recipies_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/get_all_shopping_lists_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/remove_shopping_list_usecase.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  final GetAllShoppingListsUseCase getAllShoppingListsUseCase;
  final GetAllRecpiesUseCase getAllRecpiesUseCase;
  final RemoveShoppingListUseCase removeShoppingListUseCase;
  ShoppingListCubit(
      {required this.removeShoppingListUseCase,
      required this.getAllRecpiesUseCase,
      required this.getAllShoppingListsUseCase})
      : super(const ShoppingListState());

  List<ShoppingList> _shoppingLists = List<ShoppingList>.empty(growable: true);
  void handleDialogAfterDismiss(ShoppingList shoppingList) {
    Get.back();
    emit(
        state.copyWith(shoppingLists: _shoppingLists..insert(0, shoppingList)));
    // emit(state.copyWith());
  }

  void removeShoppingList(ShoppingList shoppingList) {
    final response = removeShoppingListUseCase(
        RemoveShoppingListParams(key: shoppingList.name!));

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          shoppingListRequestState: RequestState.error));
    },
        (result) => emit(state.copyWith(
            shoppingLists: _shoppingLists..remove(shoppingList))));
  }

  void getAllShoppingList() async {
    final response = await getAllShoppingListsUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          shoppingListRequestState: RequestState.error));
    }, (shoppingList) {
      _shoppingLists = List.from(shoppingList);
      emit(state.copyWith(
          shoppingListRequestState: RequestState.loaded,
          shoppingLists: _shoppingLists));
    });
  }

  void getRecipies() async {
    final response = await getAllRecpiesUseCase(const GetAllBrandsParams());

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          recipiesRequestState: RequestState.error));
    }, (result) {
      if (!isClosed) {
        emit(state.copyWith(
            recipiesRequestState: RequestState.loaded,
            recipies: result.limit(5)));
      }
    });
  }
}
