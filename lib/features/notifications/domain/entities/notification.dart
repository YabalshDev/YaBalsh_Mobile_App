import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/section.dart';

class Notification extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? imagePath;
  final bool? isClickable;
  final Section? section;

  const Notification(
      {this.id,
      this.title,
      this.description,
      this.imagePath,
      this.isClickable,
      this.section});

  @override
  List<Object?> get props =>
      [id, title, description, imagePath, isClickable, section];
}
