import 'package:yabalash_mobile_app/features/orders/domain/entities/order_response_product.dart';

class OrderResponseProductModel extends OrderResponseProduct {
  const OrderResponseProductModel(
      {int? id, int? quantity, double? price, double? total, String? name})
      : super(
            id: id, name: name, price: price, quantity: quantity, total: total);

  factory OrderResponseProductModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseProductModel(
          id: json['id'],
          name: json['name'],
          price: double.parse(json['price'] as String),
          quantity: json['quantity'],
          total: double.parse(json['total'] as String));
}