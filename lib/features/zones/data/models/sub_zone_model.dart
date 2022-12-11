import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

class SubZoneModel extends SubZone {
  const SubZoneModel({int? id, String? mainZoneName, String? name})
      : super(id: id, mainZoneName: mainZoneName, name: name);

  factory SubZoneModel.fromJson(Map<String, dynamic> json) {
    return SubZoneModel(
        id: json['id'], name: json['name'], mainZoneName: 'القاهرة');
  }
}
