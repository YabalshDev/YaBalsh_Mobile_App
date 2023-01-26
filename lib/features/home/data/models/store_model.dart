import 'package:yabalash_mobile_app/features/home/data/models/location_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';

class StoreModel extends Store {
  const StoreModel(
      {int? id,
      String? name,
      String? cardImagePath,
      String? logoImagePath,
      List<LocationModel>? locations})
      : super(
            cardImagePath: cardImagePath,
            id: id,
            locations: locations,
            logoImagePath: logoImagePath,
            name: name);

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        cardImagePath: json["cardImagePath"] ?? json["imagePath"] ?? '',
        logoImagePath: json["logoImagePath"] ?? json["imagePath"] ?? '',
        locations: json['locations'] != null
            ? (json["locations"] as List<dynamic>)
                .map((e) => LocationModel.fromJson(e))
                .toList()
            : json['location'] != null
                ? [LocationModel.fromJson(json['location'])]
                : []);
  }
}
