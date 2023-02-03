import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/models/brand_model.dart';

import '../../domain/entities/brand.dart';

class BrandsResponseModel extends ApiResponse {
  const BrandsResponseModel({String? message, bool? success, List<Brand>? data})
      : super(data: data, message: message, success: success);

  factory BrandsResponseModel.fromJson(Map<String, dynamic> json) {
    return BrandsResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => BrandModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
