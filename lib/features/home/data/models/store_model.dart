import 'package:yabalash_mobile_app/features/home/data/models/location_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';

class StoreModel extends Store {
  const StoreModel(
      {int? id,
      String? name,
      String? cardImagePath,
      String? logoImagePath,
      List<LocationModel>? locations})
      : super(cardImagePath: cardImagePath);

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
        id: json['id'],
        name: json['name'],
        cardImagePath: json['cardImagePath'],
        logoImagePath: json['logoImagePath'],
        locations: (json['locations'] as List<dynamic>)
            .map((e) => LocationModel.fromJson(e))
            .toList());
  }
}
