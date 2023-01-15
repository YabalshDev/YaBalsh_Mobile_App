import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/categories/data/models/sub_category_model.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/sub_category.dart';

class SubCategoriesResponseModel extends ApiResponse {
  const SubCategoriesResponseModel(
      {String? message, bool? success, List<SubCategory>? data})
      : super(data: data, message: message, success: success);

  factory SubCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => SubCategoryModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
