import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/categories/data/models/category_model.dart';

import '../../domain/entities/category.dart';

class CategoriesResponseModel extends ApiResponse {
  const CategoriesResponseModel(
      {String? message, bool? success, List<Category>? data})
      : super(data: data, message: message, success: success);

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => CategoryModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
