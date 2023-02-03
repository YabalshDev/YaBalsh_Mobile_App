import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/zones/data/models/main_zone_model.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/main_zone.dart';

class MainZoneResponseModel extends ApiResponse {
  const MainZoneResponseModel(
      {String? message, List<MainZone>? data, bool? success})
      : super(data: data, message: message, success: success);

  factory MainZoneResponseModel.fromJson(Map<String, dynamic> json) {
    return MainZoneResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => MainZoneModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
