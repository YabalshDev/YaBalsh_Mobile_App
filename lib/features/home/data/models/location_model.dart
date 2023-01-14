import 'package:yabalash_mobile_app/features/home/domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel(
      {String? zone,
      String? address,
      double? lat,
      double? lon,
      int? mainZoneId,
      int? subZoneId,
      String? mapImage,
      String? deliveryFees,
      int? deliveryTime})
      : super(
            address: address,
            deliveryFees: deliveryFees,
            mainZoneId: mainZoneId,
            mapImage: mapImage,
            subZoneId: subZoneId,
            deliveryTime: deliveryTime,
            lat: lat,
            lon: lon,
            zone: zone);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        zone: json['zone'],
        mainZoneId: json['mainZoneId'],
        subZoneId: json['subZoneId'],
        mapImage: json['mapImagePath'],
        deliveryFees: json['deliveryFees'],
        address: json['address'],
        lat: json['lat'].runtimeType == String
            ? double.parse(json['lat'] as String)
            : json['lat'],
        lon: json['long'].runtimeType == String
            ? double.parse(json['long'] as String)
            : json['long'],
        deliveryTime: json['deliveryTime']);
  }
}
