import '../../../categories/domain/entities/category.dart';

class MainCategory extends Category {
  const MainCategory({
    int? id,
    String? imagePath,
    String? name,
  }) : super(id: id, imagePath: imagePath, name: name);
  @override
  List<Object?> get props => [name, imagePath, id];
}
