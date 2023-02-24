import 'package:equatable/equatable.dart';

import 'location.dart';
import 'price_model.dart';

class Store extends Equatable {
  final int? id;
  final String? name;
  final String? cardImagePath;
  final String? logoImagePath;

  final List<Location>? locations;

  const Store(
      {this.id,
      this.name,
      this.cardImagePath,
      this.locations,
      this.logoImagePath});

  factory Store.fromPricesMap(MapEntry<String, PriceModel> price) {
    return Store(
        id: price.value.storeId,
        cardImagePath: price.value.storeImagePath,
        logoImagePath: price.value.logoImagePath,
        name: price.key);
  }

  Store copyWith(
          {int? id,
          String? name,
          String? cardImagePath,
          List<Location>? locations,
          String? logoImagePath}) =>
      Store(
          id: id ?? this.id,
          name: name ?? this.name,
          logoImagePath: logoImagePath ?? this.logoImagePath,
          cardImagePath: cardImagePath ?? this.cardImagePath,
          locations: locations ?? this.locations);

  @override
  List<Object?> get props =>
      [id, name, cardImagePath, logoImagePath, locations];
}
