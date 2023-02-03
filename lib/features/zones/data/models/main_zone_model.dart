import 'package:yabalash_mobile_app/features/zones/domain/entities/main_zone.dart';

class MainZoneModel extends MainZone {
  const MainZoneModel({int? id, String? name}) : super(id: id, name: name);

  factory MainZoneModel.fromJson(Map<String, dynamic> json) {
    return MainZoneModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
