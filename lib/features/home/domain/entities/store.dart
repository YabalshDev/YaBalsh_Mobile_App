import 'package:equatable/equatable.dart';

import 'location.dart';

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

  Store copyWith(
          {int? id,
          String? name,
          String? cardImagePath,
          List<Location>? locations,
          String? logoImagePath}) =>
      Store(
          id: id ?? this.id,
          name: name ?? this.name,
          cardImagePath: cardImagePath ?? this.cardImagePath,
          locations: locations ?? this.locations);

  @override
  List<Object?> get props =>
      [id, name, cardImagePath, logoImagePath, locations];
}
