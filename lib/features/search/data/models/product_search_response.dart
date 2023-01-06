import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/home/data/models/product_model.dart';

import '../../../home/domain/entities/product.dart';

class ProductSearchResponse extends ApiResponse {
  const ProductSearchResponse(
      {String? message, bool? success, List<Product>? data})
      : super(data: data, message: message, success: success);

  factory ProductSearchResponse.fromJson(Map<String, dynamic> json) {
    return ProductSearchResponse(
        data: (json['data'] as List<dynamic>)
            .map((e) => ProductModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
