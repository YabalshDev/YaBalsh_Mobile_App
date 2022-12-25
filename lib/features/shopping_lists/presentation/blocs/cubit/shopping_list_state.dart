part of 'shopping_list_cubit.dart';

class ShoppingListState extends Equatable {
  final RequestState? shoppingListRequestState;
  final List<ShoppingList>? shoppingLists;
  final String? errorMessage;

  const ShoppingListState(
      {this.shoppingListRequestState = RequestState.loading,
      this.shoppingLists = const [],
      this.errorMessage = ''});

  ShoppingListState copyWith(
          {RequestState? shoppingListRequestState,
          List<ShoppingList>? shoppingLists,
          String? errorMessage}) =>
      ShoppingListState(
          errorMessage: errorMessage ?? this.errorMessage,
          shoppingListRequestState:
              shoppingListRequestState ?? this.shoppingListRequestState,
          shoppingLists: shoppingLists ?? this.shoppingLists);

  @override
  List<Object> get props =>
      [shoppingLists!, shoppingListRequestState!, errorMessage!];
}
