import 'package:equatable/equatable.dart';

import 'order_product.dart';

class OrderRequest extends Equatable {
  final List<OrderProduct>? products;
  final int? addressId;
  final int? storeId;

  const OrderRequest({this.products, this.addressId, this.storeId});

  @override
  List<Object?> get props => [products, addressId, storeId];
}
