import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/home/data/models/product_model.dart';

import '../../../home/domain/entities/product.dart';

class ProductResponseModel extends ApiResponse {
  const ProductResponseModel({String? message, bool? success, Product? data})
      : super(data: data, message: message, success: success);

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
        data: ProductModel.fromJson(json['data']),
        message: json['message'],
        success: json['success']);
  }
}
