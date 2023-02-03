import 'package:yabalash_mobile_app/features/home/data/models/product_model.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/models/brand_model.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../../../home/domain/entities/product.dart';
import '../../domain/entities/brand.dart';

class RecipieModel extends Recipie {
  const RecipieModel(
      {int? id,
      String? imagePath,
      String? title,
      String? subTitle,
      String? videoLink,
      Brand? brand,
      int? duration,
      List<Product>? products})
      : super(
            id: id,
            title: title,
            imagePath: imagePath,
            brand: brand,
            duration: duration,
            products: products,
            subTitle: subTitle,
            videoLink: videoLink);

  factory RecipieModel.fromJson(Map<String, dynamic> json) {
    return RecipieModel(
        id: json['id'] ?? -1,
        title: json['title'] ?? "",
        imagePath: json['imagePath'] ?? '',
        subTitle: json['subTitle'] ?? '',
        brand: json['brand'] != null
            ? BrandModel.fromJson(json['brand'])
            : const Brand(),
        duration: json['duration'] ?? 0,
        videoLink: json['videoLink'] ?? '',
        products: json['products'] != null
            ? (json['products'] as List<dynamic>)
                .map((e) => ProductModel.fromJson(e))
                .toList()
            : []);
  }
}
