import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/home/data/models/main_category_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/main_category.dart';

class MainCategoriesResponseModel extends ApiResponse {
  const MainCategoriesResponseModel(
      {String? message, bool? success, List<MainCategory>? data})
      : super(data: data, message: message, success: success);

  factory MainCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return MainCategoriesResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => MainCategoryModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
