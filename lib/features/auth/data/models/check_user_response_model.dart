import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';

class CheckUserRegisterdResponseModel extends ApiResponse {
  const CheckUserRegisterdResponseModel(
      {String? message, bool? data, bool? success})
      : super(data: data, success: success, message: message);

  factory CheckUserRegisterdResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckUserRegisterdResponseModel(
        data: json['data'], message: json['message'], success: json['success']);
  }

  @override
  List<Object?> get props => [data, message, success];
}
