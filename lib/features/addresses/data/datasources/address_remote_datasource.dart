import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/core/services/user_service.dart';
import 'package:yabalash_mobile_app/core/services/zone_service.dart';
import 'package:yabalash_mobile_app/features/addresses/data/models/address_list_response_model.dart';
import 'package:yabalash_mobile_app/features/addresses/data/models/address_model.dart';
import 'package:yabalash_mobile_app/features/addresses/data/models/address_request_model.dart';
import 'package:yabalash_mobile_app/features/addresses/data/models/address_response_model.dart';

import '../../../../core/depedencies.dart';

abstract class AddressRemoteDatasource {
  Future<List<AddressModel>> getAllAddresses();
  Future<AddressModel> addAddress(
      {required AddressRequestModel addressRequest});
  Future<AddressModel> editAddress(
      {required int id, required AddressRequestModel addressRequest});
  Future<void> deleteAddress({required int id});
}

class AddressRemoteDataSourceImpl implements AddressRemoteDatasource {
  final RestApiProvider restApiProvider;

  AddressRemoteDataSourceImpl({
    required this.restApiProvider,
  });

  final Map<String, dynamic> addressHeaders = {
    'zone': getIt<ZoneService>().getCurrentSubZone()!.id,
    'authorization': 'Bearer ${getIt<UserService>().token}'
  };

  final updateAddressHeaders = {
    'authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTY1LjIyNy4xNjAuMTI1L2FwaS92MS9hdXRoL2xvZ2luIiwiaWF0IjoxNjcxMTA3NzIyLCJleHAiOjE2NzM2OTk3MjIsIm5iZiI6MTY3MTEwNzcyMiwianRpIjoiQnBuY2tRR2M5OG5YNzFRNiIsInN1YiI6IjIiLCJwcnYiOiI2MTM0MDBlZmIxYmZiNTBmOTZmOTBiM2VmZjNlYjFlNDlkZjRlODFkIn0.6RbctdKrSRvUiniclX4OeG5_Cb3wdi729H7_qvbu2W8'
  };
  @override
  Future<AddressModel> addAddress(
      {required AddressRequestModel addressRequest}) async {
    //get token
    final response = await restApiProvider.post(addressEndPoint,
        body: addressRequest.toJson(), headers: addressHeaders);
    final result = AddressResponseModel.fromJson(response);
    return result.data as AddressModel;
  }

  @override
  Future<void> deleteAddress({required int id}) async {
    await restApiProvider.delete(getAddressEndPointById(id),
        headers: updateAddressHeaders);
  }

  @override
  Future<AddressModel> editAddress(
      {required int id, required AddressRequestModel addressRequest}) async {
    final response = await restApiProvider.put(getAddressEndPointById(id),
        body: addressRequest.toJson(), headers: updateAddressHeaders);

    final result = AddressResponseModel.fromJson(response);
    return result.data as AddressModel;
  }

  @override
  Future<List<AddressModel>> getAllAddresses() async {
    final response =
        await restApiProvider.get(addressEndPoint, headers: addressHeaders);
    final result = AddressListResponseModel.fromJson(response);
    return result.data as List<AddressModel>;
  }
}
