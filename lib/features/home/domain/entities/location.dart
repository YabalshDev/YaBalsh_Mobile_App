import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final int? mainZoneId;
  final int? subZoneId;
  final String? zone;
  final String? address;
  final double? lat;
  final double? lon;
  final String? mapImage;
  final int? deliveryTime;
  final String? deliveryFees;

  const Location(
      {this.zone,
      this.address,
      this.lat,
      this.lon,
      this.mapImage,
      this.deliveryTime,
      this.deliveryFees,
      this.mainZoneId,
      this.subZoneId});

  @override
  List<Object?> get props => [
        zone,
        address,
        lat,
        lon,
        deliveryTime,
        deliveryFees,
        mainZoneId,
        subZoneId,
        mapImage
      ];
}
