import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_data_model.dart';

class LoginResponseModel extends ApiResponse {
  const LoginResponseModel(
      {String? message, LoginDataModel? data, bool? success})
      : super(data: data, success: success, message: message);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        data: LoginDataModel.fromJson(json['data']),
        message: json['message'],
        success: json['success']);
  }

  @override
  List<Object?> get props => [data, message, success];
}
