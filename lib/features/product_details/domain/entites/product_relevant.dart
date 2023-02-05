import 'package:equatable/equatable.dart';

import '../../../categories/domain/entities/category.dart';
import '../../../home/domain/entities/section.dart';

class ProductRelevant extends Equatable {
  final List<Category>? subCategories;
  final List<Section>? sections;

  const ProductRelevant({this.subCategories, this.sections});
  @override
  List<Object?> get props => [subCategories, sections];
}
