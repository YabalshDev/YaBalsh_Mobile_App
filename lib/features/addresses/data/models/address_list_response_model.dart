import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';

import 'address_model.dart';

class AddressListResponseModel extends ApiResponse {
  const AddressListResponseModel(
      {bool? success, List<AddressModel>? data, String? message})
      : super(data: data, message: message, success: success);

  factory AddressListResponseModel.fromJson(Map<String, dynamic> json) {
    return AddressListResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => AddressModel.fromJson(e))
            .toList(),
        success: json['success'],
        message: json['message']);
  }
}
