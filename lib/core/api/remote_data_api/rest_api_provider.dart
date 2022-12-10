// ignore_for_file: file_names

import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';

abstract class RestApiProvider {
  Future<ApiResponse> get(String path, {Map<String, dynamic>? queryParams});

  Future<ApiResponse> post(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? body});

  Future<ApiResponse> put(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? body});

  Future<ApiResponse> delete(String path, {Map<String, dynamic>? queryParams});
}
