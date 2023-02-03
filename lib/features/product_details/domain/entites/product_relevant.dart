import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/sub_category.dart';

import '../../../home/domain/entities/section.dart';

class ProductRelevant extends Equatable {
  final List<SubCategory>? subCategories;
  final List<Section>? sections;

  const ProductRelevant({this.subCategories, this.sections});
  @override
  // TODO: implement props
  List<Object?> get props => [subCategories, sections];
}
