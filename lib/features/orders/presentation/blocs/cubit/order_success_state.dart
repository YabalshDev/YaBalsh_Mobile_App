part of 'order_success_cubit.dart';

class OrderSuccessState extends Equatable {
  final bool? viewDetails;

  const OrderSuccessState({this.viewDetails = false});

  @override
  List<Object> get props => [viewDetails!];
}
