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
    String? mainZone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
            addressName: addressName,
            apartmentNo: apartmentNo,
            buildingNo: buildingNo,
            createdAt: createdAt,
            floor: floor,
            zone: zone,
            mainZone: mainZone,
            fullAddress: fullAddress,
            id: id,
            updatedAt: updatedAt);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        apartmentNo: json['apartment_no'] ?? '0',
        buildingNo: json['building_no'] ?? '0',
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'].toString())
            : DateTime.now(),
        floor: json['floor_no'] ?? '0',
        fullAddress: json['address_line'] ?? 'عنوان غير متوفر',
        mainZone: json['address_line'] != null
            ? (json['address_line']).toString().split('%')[3]
            : 'غير متوفر',
        addressName: json['address_line'] != null
            ? (json['address_line']).toString().split('%')[0]
            : 'غير متوفر',
        id: json['id'] ?? 0,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['created_at'].toString())
            : DateTime.now(),
        zone: json['subZone'] ?? 'غير موجود');
  }
}
