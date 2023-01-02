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
        firstName: json['firstName'] ?? json['first_name'],
        lastName: json['lastName'] ?? json['first_name'],
        phoneNumber: json['phoneNumber'] ?? json['phone_number']);
  }
}
