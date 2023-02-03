import 'package:yabalash_mobile_app/features/home/domain/entities/main_category.dart';

class MainCategoryModel extends MainCategory {
  const MainCategoryModel({
    int? id,
    String? name,
    String? imagePath,
  }) : super(id: id, name: name, imagePath: imagePath);

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) {
    return MainCategoryModel(
        id: json['id'], name: json['name'], imagePath: json['imagePath']);
  }
}
