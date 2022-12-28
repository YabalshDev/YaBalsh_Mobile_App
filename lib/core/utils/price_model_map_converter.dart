import '../../features/home/domain/entities/price_model.dart';

Map<String, PriceModel> mapJsonToPriceModelMap(Map<String, dynamic> json) {
  final entries = json.entries
      .map((e) => MapEntry(e.key, PriceModel.fromJson(e.value)))
      .toList();
  return Map.fromEntries(entries);
}
