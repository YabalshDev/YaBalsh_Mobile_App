import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/customer_model.dart';

class RegisterResponseModel extends ApiResponse {
  const RegisterResponseModel(
      {String? message, CustomerModel? data, bool? success})
      : super(data: data, success: success, message: message);

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
        data: CustomerModel.fromJson(json['data']),
        message: json['message'],
        success: json['success']);
  }

  @override
  List<Object?> get props => [data, message, success];
}
