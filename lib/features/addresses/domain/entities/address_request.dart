import 'package:equatable/equatable.dart';

class AddressRequest extends Equatable {
  final String? addressLine;
  final String? buildingNo;
  final String? floorNo;
  final String? apartmentNo;

  const AddressRequest(
      {this.addressLine, this.buildingNo, this.floorNo, this.apartmentNo});
  @override
  List<Object?> get props => [addressLine, buildingNo, floorNo, apartmentNo];
}
