import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/features/orders/data/models/order_api_response.dart';
import 'package:yabalash_mobile_app/features/orders/data/models/order_request_model.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order_request.dart';

import '../../../../core/services/user_service.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<OrderModel> createOrder({required OrderRequest orderRequest});
  Future<List<OrderModel>> getOrders({int? page});
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final RestApiProvider restApiProvider;

  OrderRemoteDataSourceImpl({required this.restApiProvider});

  @override
  Future<OrderModel> createOrder({required OrderRequest orderRequest}) async {
    final token = getIt<UserService>().token;
    final OrderRequestModel orderRequestModel = OrderRequestModel(
        addressId: orderRequest.addressId,
        products: orderRequest.products,
        storeId: orderRequest.storeId);
    final response = await restApiProvider.post(ordersEndpoint,
        body: orderRequestModel.toJson(),
        headers: token.isNotEmpty ? {'authorization': 'Bearer $token'} : null);

    return (OrderApiResponse.fromJson(response)).data as OrderModel;
  }

  @override
  Future<List<OrderModel>> getOrders({int? page}) async {
    final token = getIt<UserService>().token;
    final response = await restApiProvider.get(ordersEndpoint,
        queryParams: page != null ? {'page': page} : null,
        headers: token.isNotEmpty ? {'authorization': 'Bearer $token'} : null);

    return ((response['data']) as List<dynamic>)
        .map((e) => OrderModel.fromJson(e))
        .toList();
  }
}
