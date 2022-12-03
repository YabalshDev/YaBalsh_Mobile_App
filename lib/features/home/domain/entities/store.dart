import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final String? id;
  final String? name;
  final String? imagePath;
  final double? deliveryTime;
  final Map<String, dynamic>? location;

  const Store(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.deliveryTime,
      required this.location});

  @override
  List<Object?> get props => [
        id,
        name,
        imagePath,
        deliveryTime,
        location,
      ];
}
