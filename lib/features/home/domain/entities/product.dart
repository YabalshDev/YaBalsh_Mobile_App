import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/price_model.dart';

class Product extends Equatable {
  final String? id;
  final String? name;
  final String? imagePath;
  final double? size;
  final String? sizeType;
  final Map<String, PriceModel>? prices;

  const Product(
      {this.id,
      this.name,
      this.imagePath,
      this.size,
      this.sizeType,
      this.prices});

  @override
  List<Object?> get props => [id, name, imagePath, size, sizeType, prices];
}
