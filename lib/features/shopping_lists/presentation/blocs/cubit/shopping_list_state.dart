part of 'shopping_list_cubit.dart';

class ShoppingListState extends Equatable {
  final RequestState? shoppingListRequestState;
  final List<ShoppingList>? shoppingLists;
  final RequestState? recipiesRequestState;
  final List<Recipie>? recipies;
  final String? errorMessage;

  const ShoppingListState(
      {this.shoppingListRequestState = RequestState.loading,
      this.shoppingLists = const [],
      this.recipies = const [],
      this.recipiesRequestState = RequestState.loading,
      this.errorMessage = ''});

  ShoppingListState copyWith(
          {RequestState? shoppingListRequestState,
          List<ShoppingList>? shoppingLists,
          RequestState? recipiesRequestState,
          List<Recipie>? recipies,
          String? errorMessage}) =>
      ShoppingListState(
          recipies: recipies ?? this.recipies,
          recipiesRequestState:
              recipiesRequestState ?? this.recipiesRequestState,
          errorMessage: errorMessage ?? this.errorMessage,
          shoppingListRequestState:
              shoppingListRequestState ?? this.shoppingListRequestState,
          shoppingLists: shoppingLists ?? this.shoppingLists);

  @override
  List<Object> get props => [
        shoppingLists!,
        shoppingListRequestState!,
        errorMessage!,
        recipies!,
        recipiesRequestState!
      ];
}
