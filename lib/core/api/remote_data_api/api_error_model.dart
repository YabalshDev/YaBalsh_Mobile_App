import 'package:equatable/equatable.dart';

import '../../errors/error_messages.dart';

class ApiErrorModel extends Equatable {
  final bool? success;
  final String? message;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(message: json['message'], success: false);
  }

  factory ApiErrorModel.fromError(int statusCode, String errorMessage) {
    if (AppErrorMessages.errorMessagesTranslator[errorMessage] != null) {
      return ApiErrorModel(
          message: AppErrorMessages.errorMessagesTranslator[errorMessage],
          success: false);
    } else {
      return ApiErrorModel(
          message: AppErrorMessages.statusCodesTranslator[statusCode],
          success: false);
    }
  }

  const ApiErrorModel({this.success, this.message});

  @override
  List<Object?> get props => [success, message];
}
