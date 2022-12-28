import 'package:yabalash_mobile_app/features/search/domain/entities/store_search.dart';

import '../../../home/data/models/location_model.dart';

class StoreSearchModel extends StoreSearch {
  const StoreSearchModel(
      {int? id,
      String? name,
      String? cardImagePath,
      String? logoImagePath,
      LocationModel? location})
      : super(
            cardImagePath: cardImagePath,
            id: id,
            location: location,
            logoImagePath: logoImagePath,
            name: name);

  factory StoreSearchModel.fromJson(Map<String, dynamic> json) {
    return StoreSearchModel(
        id: json["id"],
        name: json["name"],
        cardImagePath: json["cardImagePath"],
        logoImagePath: json["logoImagePath"],
        location: LocationModel.fromJson(json['location']));
  }
}
