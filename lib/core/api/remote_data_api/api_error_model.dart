import 'package:equatable/equatable.dart';

class ApiErrorModel extends Equatable {
  final bool? success;
  final String? message;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(message: json['message'], success: false);
  }

  const ApiErrorModel({this.success, this.message});

  @override
  List<Object?> get props => [success, message];
}
