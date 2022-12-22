import 'package:yabalash_mobile_app/features/orders/data/models/order_product_model.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order_request.dart';

class OrderRequestModel extends OrderRequest {
  const OrderRequestModel(
      {List<OrderProductModel>? products, int? addressId, int? storeId})
      : super(addressId: addressId, products: products, storeId: storeId);

  Map<String, dynamic> toJson() {
    return {
      "products":
          products!.map((e) => (e as OrderProductModel).toJson()).toList(),
      "address_id": 1,
      "store_id": 1
    };
  }
}
