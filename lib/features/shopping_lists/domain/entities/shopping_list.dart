import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../cart/domain/entities/cart_item.dart';
part 'shopping_list.g.dart';

@HiveType(typeId: 7)
class ShoppingList extends Equatable {
  @HiveField(25)
  final String? name;
  @HiveField(26)
  final List<CartItem>? products;

  const ShoppingList({this.name, this.products});

  ShoppingList copyWith({String? name, List<CartItem>? products}) =>
      ShoppingList(
          name: name ?? this.name, products: products ?? this.products);
  @override
  List<Object?> get props => [name, products];
}
