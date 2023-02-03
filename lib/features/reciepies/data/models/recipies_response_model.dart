import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/models/recipie_model.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

class RecipiesResponseModel extends ApiResponse {
  const RecipiesResponseModel(
      {String? message, bool? success, List<Recipie>? data})
      : super(data: data, message: message, success: success);

  factory RecipiesResponseModel.fromJson(Map<String, dynamic> json) {
    return RecipiesResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => RecipieModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
