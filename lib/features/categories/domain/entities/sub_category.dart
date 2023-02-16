import 'category.dart';

class SubCategory extends Category {
  const SubCategory({
    int? id,
    String? imagePath,
    String? name,
  }) : super(id: id, imagePath: imagePath, name: name);
  @override
  List<Object?> get props => [name, imagePath, id];
}
