import 'package:yabalash_mobile_app/features/home/domain/entities/price_model.dart';

import '../../features/cart/domain/entities/store_price.dart';

Map<String, StorePrice> sortStoresPrices(Map<String, StorePrice> prices) {
  List<MapEntry<String, StorePrice>> entries = prices.entries.toList();
  entries.sort(
    (a, b) => a.value.price!.compareTo(b.value.price!),
  );

  return Map.fromEntries(entries);
}

Map<String, PriceModel> sortProductPrices(
    Map<String, PriceModel> productPrices) {
  List<MapEntry<String, PriceModel>> entries = productPrices.entries.toList();
  entries.sort(
    (a, b) => a.value.price!.compareTo(b.value.price!),
  );

  return Map.fromEntries(entries);
}
