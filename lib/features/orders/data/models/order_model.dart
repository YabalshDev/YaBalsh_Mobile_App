import 'package:yabalash_mobile_app/features/addresses/data/models/address_model.dart';
import 'package:yabalash_mobile_app/features/orders/data/models/order_response_product_model.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order.dart';

import '../../../addresses/domain/entities/address.dart';
import '../../domain/entities/order_response_product.dart';

class OrderModel extends Order {
  const OrderModel({
    Address? address,
    String? status,
    DateTime? orderDate,
    List<OrderResponseProduct>? products,
    int? id,
    double? subTotal,
  }) : super(
            address: address,
            id: id,
            orderDate: orderDate,
            products: products,
            status: status,
            subTotal: subTotal);

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      address: AddressModel.fromJson(json['address']),
      id: json['id'],
      orderDate: DateTime.parse(json['orderDate']),
      products: (json['products'] as List<dynamic>)
          .map((e) => OrderResponseProductModel.fromJson(e))
          .toList(),
      status: json['status'],
      subTotal: json['subTotal'].toDouble());
}
