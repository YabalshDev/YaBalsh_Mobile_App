import 'package:equatable/equatable.dart';

class RegisterRequestModel extends Equatable {
  final String? phoneNumber;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? email;

  const RegisterRequestModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.password});

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password
    };
  }

  @override
  List<Object?> get props => [phoneNumber, password];
}
