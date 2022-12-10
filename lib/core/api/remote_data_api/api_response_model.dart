import 'package:equatable/equatable.dart';

class ApiResponse extends Equatable {
  final bool? success;
  final dynamic data;
  final String? message;

  const ApiResponse({this.success, this.data, this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [success, data, message];
}
