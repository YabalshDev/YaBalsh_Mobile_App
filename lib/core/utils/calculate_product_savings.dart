import 'package:yabalash_mobile_app/features/home/domain/entities/price_model.dart';

import '../../features/home/domain/entities/product.dart';

double calculateSavingsAmount(Product product) {
  List<MapEntry<String, PriceModel>> productPrices =
      product.prices!.entries.toList();

  return (productPrices.last.value.price! - productPrices.first.value.price!);
}

double calculateSavingsPercentage(Product product) {
  List<MapEntry<String, PriceModel>> productPrices =
      product.prices!.entries.toList();

  double saving =
      (productPrices.last.value.price! - productPrices.first.value.price!);

  return (saving / productPrices.last.value.price!) * 100;
}
