import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';

import '../../../../core/utils/price_model_map_converter.dart';
import '../../domain/entities/price_model.dart';

class ProductModel extends Product {
  const ProductModel(
      {int? id,
      String? name,
      String? imagePath,
      String? size,
      String? barcode,
      Map<String, PriceModel>? prices})
      : super(
            imagePath: imagePath,
            id: id,
            prices: prices,
            barCode: barcode,
            size: size,
            name: name);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        barcode: json['barCode'] ?? '',
        imagePath: json['imagePath'] ?? '',
        prices: json['prices'] != null
            ? mapJsonToPriceModelMap(json['prices'])
            : {},
        size: json['size'] ?? "");
  }
}
