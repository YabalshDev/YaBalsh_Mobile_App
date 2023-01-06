import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';

import '../../domain/entities/store_search.dart';
import 'store_search_model.dart';

class StoreSearchResponse extends ApiResponse {
  const StoreSearchResponse(
      {String? message, bool? success, List<StoreSearch>? data})
      : super(data: data, message: message, success: success);

  factory StoreSearchResponse.fromJson(Map<String, dynamic> json) {
    return StoreSearchResponse(
        data: (json['data'] as List<dynamic>)
            .map((e) => StoreSearchModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
