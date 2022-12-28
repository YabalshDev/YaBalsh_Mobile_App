import 'package:equatable/equatable.dart';

import '../../../cart/domain/entities/cart_item.dart';

class ShoppingListStoreModel extends Equatable {
  final int? totalPrice;
  final String? storeImagePath;
  final List<CartItem> items;

  const ShoppingListStoreModel(
      {this.totalPrice, this.storeImagePath, this.items = const []});
  @override
  List<Object?> get props => [totalPrice, storeImagePath, items];
}
