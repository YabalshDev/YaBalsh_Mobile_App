import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String? zone;
  final String? address;
  final double? lat;
  final double? lon;
  final int? deliveryTime;

  const Location(
      {this.zone, this.address, this.lat, this.lon, this.deliveryTime});

  @override
  // TODO: implement props
  List<Object?> get props => [zone, address, lat, lon, deliveryTime];
}
