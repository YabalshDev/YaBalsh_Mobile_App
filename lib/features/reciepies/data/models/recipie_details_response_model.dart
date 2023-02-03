import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/models/recipie_model.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

class RecipieDetailsResponseModel extends ApiResponse {
  const RecipieDetailsResponseModel(
      {String? message, bool? success, Recipie? data})
      : super(data: data, message: message, success: success);

  factory RecipieDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return RecipieDetailsResponseModel(
        data: RecipieModel.fromJson(json['data']),
        message: json['message'],
        success: json['success']);
  }
}
