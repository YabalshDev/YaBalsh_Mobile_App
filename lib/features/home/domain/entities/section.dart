import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';

class Section extends Equatable {
  final String? keyWord;
  final List<Product>? products;

  const Section({this.keyWord, this.products});
  @override
  List<Object?> get props => [
        keyWord,
        products,
      ];
}
