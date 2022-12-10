import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';

class ApiErrorModel extends ApiResponse {
  const ApiErrorModel({dynamic data, String? message})
      : super(data: data, success: false, message: message);

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(message: json['message'], data: json['data']);
  }

  @override
  List<Object?> get props => [data, success, message];
}
