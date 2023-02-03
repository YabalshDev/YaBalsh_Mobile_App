import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/product_details/data/models/product_response_model.dart';

import '../models/product_relevants_response_model.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductResponseModel> getProductById(
      {required int id, required bool withNearStores});

  Future<ProductRelevantsResponseModel> getProductRelevants({required int id});
}

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final RestApiProvider restApiProvider;

  ProductDetailsRemoteDataSourceImpl({required this.restApiProvider});
  @override
  Future<ProductResponseModel> getProductById(
      {required int id, required bool withNearStores}) async {
    final response = await restApiProvider.get(getProductEndPointById(id));

    return ProductResponseModel.fromJson(response);
  }

  @override
  Future<ProductRelevantsResponseModel> getProductRelevants(
      {required int id}) async {
    final response = await restApiProvider.get(getProductsRelevantsById(id));

    return ProductRelevantsResponseModel.fromJson(response);
  }
}
