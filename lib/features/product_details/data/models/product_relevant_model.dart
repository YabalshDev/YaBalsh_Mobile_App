import 'package:yabalash_mobile_app/features/categories/data/models/sub_category_model.dart';
import 'package:yabalash_mobile_app/features/home/data/models/section_model.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/entites/product_relevant.dart';

import '../../../categories/domain/entities/sub_category.dart';
import '../../../home/domain/entities/section.dart';

class ProductRelevantModel extends ProductRelevant {
  const ProductRelevantModel(
      {List<SubCategory>? subCategories, List<Section>? sections})
      : super(sections: sections, subCategories: subCategories);

  factory ProductRelevantModel.fromJson(Map<String, dynamic> json) {
    return ProductRelevantModel(
        subCategories: json['subCategories'] != null
            ? (json['subCategories'] as List<dynamic>)
                .map((e) => SubCategoryModel.fromJson(e))
                .toList()
            : [],
        sections: json['sections'] != null
            ? (json['sections'] as List<dynamic>)
                .map((e) => SectionModel.fromJson(e))
                .toList()
            : []);
  }
}
