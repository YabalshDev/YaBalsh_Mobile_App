import 'package:yabalash_mobile_app/features/addresses/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    int? id,
    String? addressName,
    String? fullAddress,
    String? zone,
    String? floor,
    String? buildingNo,
    String? apartmentNo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
            addressName: addressName,
            apartmentNo: apartmentNo,
            buildingNo: buildingNo,
            createdAt: createdAt,
            floor: floor,
            zone: zone,
            fullAddress: fullAddress,
            id: id,
            updatedAt: updatedAt);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        apartmentNo: json['apartment_no'],
        buildingNo: json['building_no'],
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'].toString())
            : DateTime.now(),
        floor: json['floor_no'],
        fullAddress: json['address_line'],
        id: json['id'],
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['created_at'].toString())
            : DateTime.now(),
        zone: json['subZone']);
  }
}
