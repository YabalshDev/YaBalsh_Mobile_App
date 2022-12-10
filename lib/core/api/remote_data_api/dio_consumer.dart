import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/api_error_model.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';

import '../../errors/exceptions.dart';
import 'interceptors.dart';
import 'rest_api_provider.dart';
import 'status_code.dart';

class DioConsumer implements RestApiProvider {
  final Dio client;

  DioConsumer({required this.client}) {
    (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    // client.options
    //   ..baseUrl = AppConstants.baseUrl
    //   ..followRedirects = false
    //   ..queryParameters = {"api_key": AppConstants.apiKey}
    //   ..validateStatus = ((status) {
    //     return status! < StatusCode.internalServerError;
    //   });

    client.interceptors.add(Get.find<AppInterceptor>());

    if (kDebugMode) {
      client.interceptors.add(Get.find<LogInterceptor>());
    }
  }

  @override
  Future<ApiResponse> delete(String path, {Map<String, dynamic>? queryParams}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> get(String path, {Map<String, dynamic>? queryParams}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> post(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> put(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw FetchDataException(
            errorModel: ApiErrorModel.fromJson(error.response!.data));
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(
                errorModel: ApiErrorModel.fromJson(error.response!.data));
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException(
                errorModel: ApiErrorModel.fromJson(error.response!.data));
          case StatusCode.notFound:
            throw NotFoundException(
                errorModel: ApiErrorModel.fromJson(error.response!.data));
          case StatusCode.confilct:
            throw ConflictException(
                errorModel: ApiErrorModel.fromJson(error.response!.data));

          case StatusCode.internalServerError:
            throw InternalServerErrorException(
                errorModel: ApiErrorModel.fromJson(error.response!.data));
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(
            errorModel: ApiErrorModel.fromJson(error.response!.data));
    }
  }
}
