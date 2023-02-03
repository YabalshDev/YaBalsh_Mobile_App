import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/home/data/models/store_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';

class NearStoresResponseModel extends ApiResponse {
  const NearStoresResponseModel(
      {String? message, bool? success, List<Store>? data})
      : super(data: data, message: message, success: success);

  factory NearStoresResponseModel.fromJson(Map<String, dynamic> json) {
    return NearStoresResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => StoreModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
