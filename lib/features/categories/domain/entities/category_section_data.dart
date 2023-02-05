import 'package:equatable/equatable.dart';

import 'category.dart';

class CategorySectionData extends Equatable {
  final String? mainCategoryName;
  final List<Category>? subCategories;

  const CategorySectionData({this.mainCategoryName, this.subCategories});

  @override
  List<Object?> get props => [mainCategoryName, subCategories];
}
