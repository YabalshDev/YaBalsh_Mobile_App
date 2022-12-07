abstract class ApiResponse {
  final bool? success;
  final dynamic data;
  final String? message;

  ApiResponse({this.success, this.data, this.message});
}
