import '../../features/home/domain/entities/price_model.dart';

Map<String, PriceModel> mapJsonToPriceModelMap(Map<String, dynamic> json) {
  List<MapEntry<String, PriceModel>> pricedEntries = [];
  for (var element in json.entries) {
    final price = PriceModel.fromJson(element.value);

    if (price.price! > 0) {
      //add price if only not 0 =>null
      pricedEntries.add(MapEntry(element.key, price));
    }
  }
  return Map.fromEntries(pricedEntries);
}
