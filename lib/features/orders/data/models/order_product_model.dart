import 'package:yabalash_mobile_app/features/orders/domain/entities/order_product.dart';

class OrderProductModel extends OrderProduct {
  const OrderProductModel({int? id, int? quantity})
      : super(id: id, quantity: quantity);

  Map<String, dynamic> toJson() {
    return {"id": id, "quantity": quantity};
  }
}
