import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/sub_category.dart';

class CategorySectionData extends Equatable {
  final String? mainCategoryName;
  final List<SubCategory>? subCategories;

  const CategorySectionData({this.mainCategoryName, this.subCategories});

  @override
  List<Object?> get props => [mainCategoryName, subCategories];
}
