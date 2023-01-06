import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/location.dart';

class StoreSearch extends Equatable {
  final int? id;
  final String? name;
  final String? cardImagePath;

  final Location? location;

  const StoreSearch({
    this.id,
    this.name,
    this.cardImagePath,
    this.location,
  });

  @override
  List<Object?> get props => [id, name, cardImagePath, location];
}
