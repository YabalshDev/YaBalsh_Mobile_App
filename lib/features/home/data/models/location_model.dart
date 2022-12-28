import 'package:yabalash_mobile_app/features/home/domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel(
      {String? zone,
      String? address,
      double? lat,
      double? lon,
      int? deliveryTime})
      : super(
            address: address,
            deliveryTime: deliveryTime,
            lat: lat,
            lon: lon,
            zone: zone);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        zone: json['zone'],
        address: json['address'],
        lat: json['lat'],
        lon: json['lon'],
        deliveryTime: json['deliveryTime']);
  }
}
