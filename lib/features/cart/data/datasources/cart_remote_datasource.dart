import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/home/data/models/store_response_model.dart';

import '../../../home/domain/entities/store.dart';

abstract class CartRemoteDataSource {
  Future<Store> getStoreById({required int id});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final RestApiProvider restApiProvider;

  CartRemoteDataSourceImpl({required this.restApiProvider});
  @override
  Future<Store> getStoreById({required int id}) async {
    final resposne = await restApiProvider.get(getStoreEndPointById(id));

    return (resposne as StoreResponseModel).data as Store;
  }
}
