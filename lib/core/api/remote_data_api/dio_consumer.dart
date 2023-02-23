import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/api_error_model.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';

import '../../depedencies.dart';
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

    client.options
      ..baseUrl = AppStrings.baseUrl
      ..followRedirects = false
      ..validateStatus = ((status) {
        return status! < StatusCode.internalServerError;
      });

    client.interceptors.add(getIt<AppInterceptor>());

    if (kDebugMode) {
      client.interceptors.add(getIt<LogInterceptor>());
    }
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await client.delete(path,
          queryParameters: queryParams,
          options: headers != null ? Options(headers: headers) : null);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        _handleStatusCodeError(response.statusCode!, response.data['message']);
      }
    } on DioError catch (err) {
      return _handleDioError(err);
    }
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await client.get(path,
          queryParameters: queryParams,
          options: headers != null ? Options(headers: headers) : null);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        _handleStatusCodeError(response.statusCode!, response.data['message']);
      }
    } on DioError catch (err) {
      return _handleDioError(err);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await client.post(path,
          queryParameters: queryParams,
          data: body,
          options: headers != null ? Options(headers: headers) : null);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        _handleStatusCodeError(response.statusCode!, response.data['message']);
      }
    } on DioError catch (err) {
      return _handleDioError(err);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await client.put(path,
          queryParameters: queryParams,
          data: body,
          options: headers != null ? Options(headers: headers) : null);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        _handleStatusCodeError(response.statusCode!, response.data['message']);
      }
    } on DioError catch (err) {
      return _handleDioError(err);
    }
  }

  dynamic _handleStatusCodeError(int statusCode, String message) {
    switch (statusCode) {
      case StatusCode.badRequest:
        throw BadRequestException(
            errorModel: ApiErrorModel.fromError(statusCode, message));
      case StatusCode.unauthorized:
      case StatusCode.forbidden:
        throw UnauthorizedException(
            errorModel: ApiErrorModel.fromError(statusCode, message));
      case StatusCode.notFound:
        throw NotFoundException(
            errorModel: ApiErrorModel.fromError(statusCode, message));
      case StatusCode.confilct:
        throw ConflictException(
            errorModel: ApiErrorModel.fromError(statusCode, message));
      case StatusCode.test:
        throw BadRequestException(
            errorModel: ApiErrorModel.fromError(statusCode, message));
      case StatusCode.internalServerError:
        throw InternalServerErrorException(
            errorModel: ApiErrorModel.fromError(statusCode, message));

      case StatusCode.notAllowed:
        throw NotAllowedException(
            errorModel: ApiErrorModel.fromError(statusCode, message));
    }
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.cancel:
        throw const FetchDataException(
            errorModel: ApiErrorModel(
                message: 'تاخر الاتصال بالسيرفر... حاول مرة اخرى'));
      case DioErrorType.response:
        _handleStatusCodeError(
            error.response!.statusCode!, error.response!.data['message']);
        break;

      case DioErrorType.other:
        throw const NoInternetConnectionException(
            errorModel:
                ApiErrorModel(message: 'مشكلة في الانترنت ...حاول لاحقا'));
    }
  }
}
