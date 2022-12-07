import 'package:equatable/equatable.dart';

abstract class ApiResponse extends Equatable {
  final bool? success;
  final dynamic data;
  final String? message;

  const ApiResponse({this.success, this.data, this.message});
}
