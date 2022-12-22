import 'package:equatable/equatable.dart';

import '../../../addresses/domain/entities/address.dart';
import 'order_response_product.dart';

class Order extends Equatable {
  final Address? address;
  final String? status;
  final DateTime? orderDate;
  final List<OrderResponseProduct>? products;
  final int? id;
  final double? subTotal;

  const Order(
      {this.products,
      this.address,
      this.status,
      this.orderDate,
      this.id,
      this.subTotal});

  @override
  List<Object?> get props =>
      [address, status, orderDate, id, subTotal, products];
}
