import 'package:equatable/equatable.dart';

class SubCategory extends Equatable {
  final int? id;
  final String? name;
  final String? imagePath;
  final String? mainCategory;

  const SubCategory(
      {this.id, this.name = '', this.imagePath = '', this.mainCategory = ''});
  @override
  List<Object?> get props => [name, imagePath, mainCategory, id];
}
