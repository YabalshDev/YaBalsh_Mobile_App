import '../../domain/entities/sub_category.dart';

class SubCategoryModel extends SubCategory {
  const SubCategoryModel(
      {int? id, String? name, String? imagePath, String? mainCategoryName})
      : super(
            id: id,
            name: name,
            imagePath: imagePath,
            mainCategory: mainCategoryName);

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
        id: json['id'], name: json['name'], imagePath: json['imagePath']);
  }
}
