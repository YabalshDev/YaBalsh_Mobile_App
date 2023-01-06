import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';

class Recipie extends Equatable {
  final int? id;
  final String? imagePath;
  final String? title;
  final String? subTitle;
  final String? videoLink;
  final String? creatorName;
  final String? creatorImagePath;
  final int? duration;
  final List<Product>? products;

  const Recipie({
    this.id,
    this.imagePath,
    this.title,
    this.subTitle,
    this.videoLink,
    this.creatorName,
    this.creatorImagePath,
    this.duration,
    this.products,
  });

  @override
  List<Object?> get props => [
        id,
        imagePath,
        title,
        subTitle,
        creatorImagePath,
        creatorName,
        videoLink,
        duration,
        products
      ];
}
