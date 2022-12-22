import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/orders/data/models/order_model.dart';

class OrderApiResponse extends ApiResponse {
  const OrderApiResponse({String? message, bool? success, OrderModel? data})
      : super(data: data, message: message, success: success);

  factory OrderApiResponse.fromJson(Map<String, dynamic> json) =>
      OrderApiResponse(
          data: OrderModel.fromJson(json['data']),
          message: json['message'],
          success: json['success']);
}
