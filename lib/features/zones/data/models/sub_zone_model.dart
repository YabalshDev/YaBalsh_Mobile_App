import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

class SubZoneModel extends SubZone {
  const SubZoneModel({int? id, int? mainZoneId, String? name})
      : super(id: id, mainZoneId: mainZoneId, name: name);

  factory SubZoneModel.fromJson(Map<String, dynamic> json) {
    return SubZoneModel(id: json['id'], name: json['name'], mainZoneId: 1);
  }
}
