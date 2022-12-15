import 'package:equatable/equatable.dart';

class LoginDataModel extends Equatable {
  final String? token;
  final int? expiresIn;

  const LoginDataModel({this.token, this.expiresIn});

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      expiresIn: json['expiresIn'],
      token: json['token'],
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
