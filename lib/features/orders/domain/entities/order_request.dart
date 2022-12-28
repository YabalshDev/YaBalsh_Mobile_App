import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/orders/data/models/order_product_model.dart';

class OrderRequest extends Equatable {
  final List<OrderProductModel>? products;
  final int? addressId;
  final int? storeId;

  const OrderRequest({this.products, this.addressId, this.storeId});

  @override
  List<Object?> get props => [products, addressId, storeId];
}
