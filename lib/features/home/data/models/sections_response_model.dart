import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/home/data/models/section_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';

class SectionsResponseModel extends ApiResponse {
  const SectionsResponseModel(
      {String? message, bool? success, List<Section>? data})
      : super(data: data, message: message, success: success);

  factory SectionsResponseModel.fromJson(Map<String, dynamic> json) {
    return SectionsResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => SectionModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
