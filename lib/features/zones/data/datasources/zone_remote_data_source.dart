import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/zones/data/models/sub_zone_response_model.dart';

abstract class ZonesRemoteDataSource {
  Future<SubZoneResponseModel> getMainZoneSubZones(
      {required int mainCategoryId});
  Future<SubZoneResponseModel> getAllMainZones();
}

class ZonesRemoteDataSourceImpl implements ZonesRemoteDataSource {
  final RestApiProvider restApiProvider;

  ZonesRemoteDataSourceImpl({required this.restApiProvider});

  @override
  Future<SubZoneResponseModel> getMainZoneSubZones(
      {required int mainCategoryId}) async {
    final response =
        await restApiProvider.get(getSubZonesEndPointById(mainCategoryId));
    return SubZoneResponseModel.fromJson(response);
  }

  @override
  Future<SubZoneResponseModel> getAllMainZones() async {
    final response = await restApiProvider.get(zonesEndPoint);
    return SubZoneResponseModel.fromJson(response);
  }
}
