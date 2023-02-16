import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    int? id,
    String? name,
    String? imagePath,
  }) : super(
          id: id,
          name: name,
          imagePath: imagePath,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'], name: json['name'], imagePath: json['imagePath']);
  }
}
