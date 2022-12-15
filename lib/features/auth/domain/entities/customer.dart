import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? email;

  const Customer(
      {this.id, this.firstName, this.lastName, this.phoneNumber, this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [id!, firstName!, lastName!, phoneNumber!, email!];
}
