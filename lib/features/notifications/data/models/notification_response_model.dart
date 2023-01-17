import 'package:yabalash_mobile_app/core/api/remote_data_api/api_response_model.dart';
import 'package:yabalash_mobile_app/features/notifications/data/models/notification_model.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/entities/notification.dart';

class NotificationResponseModel extends ApiResponse {
  const NotificationResponseModel(
      {String? message, bool? success, List<Notification>? data})
      : super(data: data, message: message, success: success);

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
        data: (json['data'] as List<dynamic>)
            .map((e) => NotificationModel.fromJson(e))
            .toList(),
        message: json['message'],
        success: json['success']);
  }
}
