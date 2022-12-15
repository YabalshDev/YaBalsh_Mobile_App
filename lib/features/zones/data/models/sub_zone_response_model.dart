import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/zones/data/models/sub_zone_model.dart';

import '../../domain/entities/sub_zone.dart';

class SubZoneResponseModel extends ApiResponse {
  const SubZoneResponseModel(
      {String? message, List<SubZone>? data, bool? success})
      : super(data: data, message: message, success: success);

  factory SubZoneResponseModel.fromJson(Map<String, dynamic> json) {
    return SubZoneResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => SubZoneModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
