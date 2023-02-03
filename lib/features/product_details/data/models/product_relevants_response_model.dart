import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/product_details/data/models/product_relevant_model.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/entites/product_relevant.dart';

class ProductRelevantsResponseModel extends ApiResponse {
  const ProductRelevantsResponseModel(
      {String? message, bool? success, ProductRelevant? data})
      : super(data: data, message: message, success: success);

  factory ProductRelevantsResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductRelevantsResponseModel(
        data: ProductRelevantModel.fromJson(json['data']),
        message: json['message'],
        success: json['success']);
  }
}
