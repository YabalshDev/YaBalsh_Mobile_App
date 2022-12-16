import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/core/services/zone_service.dart';
import 'package:yabalash_mobile_app/features/addresses/data/models/address_model.dart';
import 'package:yabalash_mobile_app/features/addresses/data/models/address_request_model.dart';
import 'package:yabalash_mobile_app/features/addresses/data/models/address_response_model.dart';

abstract class AddressRemoteRemoteDatasource {
  Future<List<AddressModel>> getAllAddresses();
  Future<AddressModel> addAddress(
      {required AddressRequestModel addressRequest});
  Future<AddressModel> editAddress(
      {required int id, required AddressRequestModel addressRequest});
  Future<void> deleteAddress({required int id});
}

class AddressRemoteDataSourceImpl implements AddressRemoteRemoteDatasource {
  final RestApiProvider restApiProvider;
  final ZoneService zoneService;

  AddressRemoteDataSourceImpl(
      {required this.zoneService, required this.restApiProvider});
  @override
  Future<AddressModel> addAddress(
      {required AddressRequestModel addressRequest}) async {
    //get token
    final zoneId = zoneService.getCurrentSubZone()!.id;
    final response = await restApiProvider.post(addressEndPoint,
        body: addressRequest.toJson(), queryParams: {'zone': zoneId});
    final result = AddressResponseModel.fromJson(response);
    return result.data as AddressModel;
  }

  @override
  Future<void> deleteAddress({required int id}) async {}

  @override
  Future<AddressModel> editAddress(
      {required int id, required AddressRequestModel addressRequest}) {
    throw UnimplementedError();
  }

  @override
  Future<List<AddressModel>> getAllAddresses() {
    // TODO: implement getAllAddresses
    throw UnimplementedError();
  }
}
