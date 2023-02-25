import 'package:equatable/equatable.dart';

import '../../../addresses/domain/entities/address.dart';
import '../../../home/domain/entities/store.dart';
import 'order_response_product.dart';

class Order extends Equatable {
  final Address? address;
  final String? status;
  final DateTime? orderDate;
  final List<OrderResponseProduct>? products;
  final int? id;
  final num? subTotal;
  final Store? store;

  const Order(
      {this.products,
      this.address,
      this.store,
      this.status,
      this.orderDate,
      this.id,
      this.subTotal});

  @override
  List<Object?> get props =>
      [address, status, orderDate, id, subTotal, products, store];
}
