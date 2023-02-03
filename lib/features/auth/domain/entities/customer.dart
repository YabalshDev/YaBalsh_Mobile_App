import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'customer.g.dart';

@HiveType(typeId: 48)
class Customer extends Equatable {
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? firstName;
  @HiveField(3)
  final String? lastName;
  @HiveField(4)
  final String? phoneNumber;
  @HiveField(5)
  final String? email;

  const Customer(
      {this.id, this.firstName, this.lastName, this.phoneNumber, this.email});

  @override
  List<Object?> get props => [id!, firstName!, lastName!, phoneNumber!, email!];
}
