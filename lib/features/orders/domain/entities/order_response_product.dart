import 'package:equatable/equatable.dart';

class OrderResponseProduct extends Equatable {
  final int? id;
  final int? quantity;
  final double? price;
  final double? total;
  final String? name;

  const OrderResponseProduct(
      {this.id, this.quantity, this.price, this.total, this.name});

  @override
  List<Object?> get props => [id, quantity, price, total, name];
}
