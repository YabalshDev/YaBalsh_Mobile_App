import '../../domain/entities/customer.dart';

class CustomerModel extends Customer {
  const CustomerModel(
      {int? id,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      String? email})
      : super(
            email: email,
            firstName: firstName,
            id: id,
            lastName: lastName,
            phoneNumber: phoneNumber);

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
        id: json['id'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber']);
  }
}
