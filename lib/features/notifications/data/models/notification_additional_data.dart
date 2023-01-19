import 'package:yabalash_mobile_app/features/home/data/models/section_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';

class NotificationAdditionalData {
  final bool? isClickable;
  final Section? section;
  const NotificationAdditionalData({this.isClickable, this.section});

  factory NotificationAdditionalData.fromJson(Map<String, dynamic> json) =>
      NotificationAdditionalData(
          isClickable: json['isClickable'] ?? true,
          section: json['section'] != null
              ? SectionModel.fromJson(
                  Map<String, dynamic>.from(json['section']))
              : const Section());
}
