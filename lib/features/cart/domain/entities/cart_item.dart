import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
part 'cart_item.g.dart';

@HiveType(typeId: 2)
class CartItem extends Equatable {
  @HiveField(6)
  final int? quantity;
  @HiveField(7)
  final Product? product;

  const CartItem({this.quantity, this.product});

  CartItem copyWith({int? quantity, Product? product}) {
    return CartItem(
        product: product ?? this.product, quantity: quantity ?? this.quantity);
  }

  @override
  List<Object?> get props => [quantity, product];
}
