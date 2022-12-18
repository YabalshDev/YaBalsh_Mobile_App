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

  @override
  List<Object?> get props =>
      [id, name, cardImagePath, logoImagePath, locations];
}
