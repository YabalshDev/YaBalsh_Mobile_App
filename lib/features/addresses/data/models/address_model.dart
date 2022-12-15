import 'package:yabalash_mobile_app/features/addresses/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    int? id,
    String? addressName,
    String? fullAddress,
    String? zone,
    int? floor,
    int? buildingNo,
    int? apartmentNo,
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
        createdAt: DateTime.parse(json['created_at'].toString()),
        floor: json['floor_no'],
        fullAddress: json['address_line'],
        id: json['id'],
        updatedAt: DateTime.parse(json['updated_at'].toString()),
        zone: json['zone']);
  }
}
