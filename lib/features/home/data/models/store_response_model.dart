import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/home/data/models/store_model.dart';

import '../../domain/entities/store.dart';

class StoreResponseModel extends ApiResponse {
  const StoreResponseModel({String? message, bool? success, Store? data})
      : super(data: data, message: message, success: success);

  factory StoreResponseModel.fromJson(Map<String, dynamic> json) {
    return StoreResponseModel(
        data: StoreModel.fromJson(json['data']),
        message: json['message'],
        success: json['success']);
  }
}
