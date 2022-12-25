part of 'shopping_list_details_cubit.dart';

class ShoppingListDetailsState extends Equatable {
  final int? selectedSuperMarketIndex;
  final List<ShoppingListStoreModel>? stores;
  final double? subTotal;
  final String? shoppingListName;

  const ShoppingListDetailsState(
      {this.stores = const [],
      this.selectedSuperMarketIndex = -1,
      this.shoppingListName = '',
      this.subTotal = 0.00});

  ShoppingListDetailsState copyWith(
          {int? selectedSuperMarketIndex,
          double? subTotal,
          String? shoppingListName,
          List<ShoppingListStoreModel>? stores}) =>
      ShoppingListDetailsState(
          shoppingListName: shoppingListName ?? this.shoppingListName,
          subTotal: subTotal ?? this.subTotal,
          selectedSuperMarketIndex:
              selectedSuperMarketIndex ?? this.selectedSuperMarketIndex,
          stores: stores ?? this.stores);
  @override
  List<Object> get props =>
      [selectedSuperMarketIndex!, stores!, subTotal!, shoppingListName!];
}
