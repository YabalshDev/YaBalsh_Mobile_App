import 'package:equatable/equatable.dart';

import 'product.dart';
import 'section.dart';

class HomeSection extends Equatable {
  final Section? section;
  final List<Product>? products;

  const HomeSection({this.section, this.products});

  @override
  List<Object?> get props => [section, products];
}
