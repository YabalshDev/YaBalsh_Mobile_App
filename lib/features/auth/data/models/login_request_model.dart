import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  final String? phoneNumber;
  final String? password;

  const LoginRequestModel({this.phoneNumber, this.password});

  Map<String, dynamic> toJson() {
    return {'phoneNumber': phoneNumber, 'password': password};
  }

  @override
  List<Object?> get props => [phoneNumber, password];
}
