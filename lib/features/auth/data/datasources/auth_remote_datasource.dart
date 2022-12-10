import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_response_model.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/register_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/register_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> loginUser(
      {required LoginRequestModel loginRequest});

  Future<RegisterResponseModel> registerUser(
      {required RegisterRequestModel requestModel});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final RestApiProvider restApiProvider;

  AuthRemoteDataSourceImpl({required this.restApiProvider});
  @override
  Future<LoginResponseModel> loginUser(
      {required LoginRequestModel loginRequest}) async {
    final response =
        await restApiProvider.post(loginEndpoint, body: loginRequest.toJson());

    return LoginResponseModel.fromJson(response);
  }

  @override
  Future<RegisterResponseModel> registerUser(
      {required RegisterRequestModel requestModel}) {
    throw UnimplementedError();
  }
}
