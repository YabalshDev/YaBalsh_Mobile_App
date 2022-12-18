import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';

import 'address_model.dart';

class AddressResponseModel extends ApiResponse {
  const AddressResponseModel(
      {bool? success, AddressModel? data, String? message})
      : super(data: data, message: message, success: success);

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) {
    return AddressResponseModel(
        data: AddressModel.fromJson(json['data']),
        success: json['success'],
        message: json['message']);
  }
}
