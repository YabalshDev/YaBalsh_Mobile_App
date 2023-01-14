import 'package:yabalash_mobile_app/features/home/data/models/section_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/banner.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';

class BannerModel extends Banner {
  const BannerModel({
    int? id,
    Section? section,
    String? imagePath,
  }) : super(id: id, section: section, imagePath: imagePath);

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
        id: json['id'] ?? -1,
        section: SectionModel.fromJson(json['section']),
        imagePath: json['imagePath'] ?? "");
  }
}
