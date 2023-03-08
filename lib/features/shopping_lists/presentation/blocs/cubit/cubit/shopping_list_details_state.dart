part of 'shopping_list_details_cubit.dart';

class ShoppingListDetailsState extends Equatable {
  final int? selectedSuperMarketIndex;
  final List<ShoppingListStoreModel>? stores;
  final double? subTotal;
  final int? saving;
  final String? shoppingListName;
  final RequestState? storesState;
  final String? errorMessage;

  const ShoppingListDetailsState(
      {this.stores = const [],
      this.selectedSuperMarketIndex = -1,
      this.errorMessage = '',
      this.storesState = RequestState.loading,
      this.saving = 0,
      this.shoppingListName = '',
      this.subTotal = 0.00});

  ShoppingListDetailsState copyWith(
          {int? selectedSuperMarketIndex,
          double? subTotal,
          String? shoppingListName,
          int? saving,
          String? errorMessage,
          RequestState? storesState,
          List<ShoppingListStoreModel>? stores}) =>
      ShoppingListDetailsState(
          shoppingListName: shoppingListName ?? this.shoppingListName,
          saving: saving ?? this.saving,
          errorMessage: errorMessage ?? this.errorMessage,
          storesState: storesState ?? this.storesState,
          subTotal: subTotal ?? this.subTotal,
          selectedSuperMarketIndex:
              selectedSuperMarketIndex ?? this.selectedSuperMarketIndex,
          stores: stores ?? this.stores);
  @override
  List<Object> get props => [
        selectedSuperMarketIndex!,
        stores!,
        subTotal!,
        shoppingListName!,
        errorMessage!
      ];
}
