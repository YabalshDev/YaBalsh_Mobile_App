import 'package:equatable/equatable.dart';

class OrderResponseProduct extends Equatable {
  final int? id;
  final int? quantity;
  final double? price;
  final double? total;
  final String? name;
  final String? imagePath;
  final String? size;

  const OrderResponseProduct(
      {this.id,
      this.quantity,
      this.price,
      this.total,
      this.name,
      this.imagePath,
      this.size});

  @override
  List<Object?> get props =>
      [id, quantity, price, total, name, imagePath, size];
}
