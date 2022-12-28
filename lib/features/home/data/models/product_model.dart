import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';

import '../../../../core/utils/price_model_map_converter.dart';
import '../../domain/entities/price_model.dart';

class ProductModel extends Product {
  const ProductModel(
      {int? id,
      String? name,
      String? imagePath,
      String? size,
      Map<String, PriceModel>? prices})
      : super(
            imagePath: imagePath,
            id: id,
            prices: prices,
            size: size,
            name: name);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"],
        name: json["name"],
        imagePath: json['imagePath'],
        prices: mapJsonToPriceModelMap(json['prices']),
        size: json['size']);
  }
}
