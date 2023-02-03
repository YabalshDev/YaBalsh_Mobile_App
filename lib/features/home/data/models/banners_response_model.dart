import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/home/data/models/banner_model.dart';

import '../../domain/entities/banner.dart';

class BannersResponseModel extends ApiResponse {
  const BannersResponseModel(
      {String? message, bool? success, List<Banner>? data})
      : super(data: data, message: message, success: success);

  factory BannersResponseModel.fromJson(Map<String, dynamic> json) {
    return BannersResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => BannerModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
