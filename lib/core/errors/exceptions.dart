import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/api_error_model.dart';

class ServerException extends Equatable implements Exception {
  final ApiErrorModel errorModel;

  const ServerException({required this.errorModel});

  @override
  List<Object?> get props => [errorModel];

  @override
  String toString() {
    return '$errorModel';
  }
}

class PlatformDataException extends ServerException {
  const PlatformDataException({required ApiErrorModel errorModel})
      : super(errorModel: errorModel);
}

class FetchDataException extends ServerException {
  const FetchDataException({required ApiErrorModel errorModel})
      : super(errorModel: errorModel);
}

class BadRequestException extends ServerException {
  const BadRequestException({required ApiErrorModel errorModel})
      : super(errorModel: errorModel);
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException({required ApiErrorModel errorModel})
      : super(errorModel: errorModel);
}

class NotAllowedException extends ServerException {
  const NotAllowedException({required ApiErrorModel errorModel})
      : super(errorModel: errorModel);
}

class NotFoundException extends ServerException {
  const NotFoundException({required ApiErrorModel errorModel})
      : super(errorModel: errorModel);
}

class ConflictException extends ServerException {
  const ConflictException({required ApiErrorModel errorModel})
      : super(errorModel: errorModel);
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException({required ApiErrorModel errorModel})
      : super(errorModel: errorModel);
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException({required ApiErrorModel errorModel})
      : super(errorModel: errorModel);
}

class CacheException implements Exception {}
