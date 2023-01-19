import 'package:yabalash_mobile_app/features/home/data/models/section_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/entities/notification.dart';

class NotificationModel extends Notification {
  const NotificationModel(
      {int? id,
      String? title,
      String? description,
      String? imagePath,
      bool? isClickable,
      Section? section})
      : super(
            description: description,
            id: id,
            imagePath: imagePath,
            isClickable: isClickable,
            section: section,
            title: title);

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
          description: json['description'] ?? '',
          id: json['id'] ?? -1,
          imagePath: json['imagePath'] ?? '',
          isClickable: json['isClickable'] ?? false,
          section: json['section'] != null
              ? SectionModel.fromJson(json['section'])
              : const Section());
}
