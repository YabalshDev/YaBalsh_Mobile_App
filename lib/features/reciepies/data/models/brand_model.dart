import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';

class BrandModel extends Brand {
  const BrandModel({
    int? id,
    String? name,
    String? imagePath,
  }) : super(
          id: id,
          name: name,
          imagePath: imagePath,
        );

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
        id: json['id'], name: json['name'], imagePath: json['imagePath']);
  }
}
