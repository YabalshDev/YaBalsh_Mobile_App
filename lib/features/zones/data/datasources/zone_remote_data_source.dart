import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/zones/data/models/sub_zone_response_model.dart';

abstract class ZonesRemoteDataSource {
  Future<SubZoneResponseModel> getAllSubZones();
}

class ZonesRemoteDataSourceImpl implements ZonesRemoteDataSource {
  final RestApiProvider restApiProvider;

  ZonesRemoteDataSourceImpl({required this.restApiProvider});

  @override
  Future<SubZoneResponseModel> getAllSubZones() async {
    final response = await restApiProvider.get(zonesEndPoint);
    return SubZoneResponseModel.fromJson(response);
  }
}
