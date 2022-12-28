import 'package:equatable/equatable.dart';

class OrderProduct extends Equatable {
  final int? quantity;
  final int? id;

  const OrderProduct({this.quantity, this.id});

  @override
  List<Object?> get props => [quantity, id];
}
