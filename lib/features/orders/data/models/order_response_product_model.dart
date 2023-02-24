import 'package:yabalash_mobile_app/features/orders/domain/entities/order_response_product.dart';

class OrderResponseProductModel extends OrderResponseProduct {
  const OrderResponseProductModel(
      {int? id,
      int? quantity,
      double? price,
      double? total,
      String? name,
      String? size,
      String? imagePath})
      : super(
            id: id,
            name: name,
            price: price,
            quantity: quantity,
            size: size,
            total: total,
            imagePath: imagePath);

  factory OrderResponseProductModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseProductModel(
          id: json['id'] ?? 0,
          name: json['name'] ?? '',
          imagePath: json['imagePath'] ?? '',
          size: json['size'] ?? '',
          price: json['price'] == null
              ? 0
              : double.parse(json['price'].toString()),
          quantity: json['quantity'] ?? 1,
          total: double.parse(json['total'] as String));
}
