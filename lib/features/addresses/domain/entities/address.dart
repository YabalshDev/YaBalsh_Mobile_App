import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int? id;
  final String? addressName;
  final String? fullAddress;
  final String? zone;
  final int? floor;
  final int? buildingNo;
  final int? apartmentNo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Address(
      {this.id,
      this.addressName,
      this.fullAddress,
      this.zone,
      this.floor,
      this.buildingNo,
      this.apartmentNo,
      this.createdAt,
      this.updatedAt});
  @override
  List<Object?> get props => [
        id,
        addressName,
        fullAddress,
        zone,
        floor,
        buildingNo,
        apartmentNo,
        createdAt,
        updatedAt
      ];
}
