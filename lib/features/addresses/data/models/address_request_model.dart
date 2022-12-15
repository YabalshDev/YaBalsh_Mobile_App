import 'package:yabalash_mobile_app/features/addresses/domain/entities/address_request.dart';

class AddressRequestModel extends AddressRequest {
  const AddressRequestModel({
    String? addressLine,
    int? floorNo,
    int? buildingNo,
    int? apartmentNo,
  }) : super(
          addressLine: addressLine,
          floorNo: floorNo,
          apartmentNo: apartmentNo,
          buildingNo: buildingNo,
        );

  Map<String, dynamic> toJson() {
    return {
      "addressLine": addressLine,
      "buildingNo": buildingNo,
      "floorNo": floorNo,
      "apartmentNo": apartmentNo
    };
  }
}
