import 'package:yabalash_mobile_app/features/categories/data/models/category_model.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/category.dart';
import 'package:yabalash_mobile_app/features/home/data/models/section_model.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/entites/product_relevant.dart';

import '../../../home/domain/entities/section.dart';

class ProductRelevantModel extends ProductRelevant {
  const ProductRelevantModel(
      {List<Category>? subCategories, List<Section>? sections})
      : super(sections: sections, subCategories: subCategories);

  factory ProductRelevantModel.fromJson(Map<String, dynamic> json) {
    return ProductRelevantModel(
        subCategories: json['subCategories'] != null
            ? (json['subCategories'] as List<dynamic>)
                .map((e) => CategoryModel.fromJson(e))
                .toList()
            : [],
        sections: json['sections'] != null
            ? (json['sections'] as List<dynamic>)
                .map((e) => SectionModel.fromJson(e))
                .toList()
            : []);
  }
}
