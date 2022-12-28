import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/location.dart';

class StoreSearch extends Equatable {
  final int? id;
  final String? name;
  final String? cardImagePath;
  final String? logoImagePath;

  final Location? location;

  const StoreSearch(
      {this.id,
      this.name,
      this.cardImagePath,
      this.location,
      this.logoImagePath});

  @override
  List<Object?> get props => [id, name, cardImagePath, logoImagePath, location];
}
