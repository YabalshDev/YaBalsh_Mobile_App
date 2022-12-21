part of 'order_summary_cubit.dart';

class OrderSummaryState extends Equatable {
  final List<Address>? userAddresses;
  final RequestState? addressesRequestState;

  const OrderSummaryState(
      {this.userAddresses = const [],
      this.addressesRequestState = RequestState.loading});

  OrderSummaryState copyWith(
      {List<Address>? userAddresses, RequestState? addressesRequestState}) {
    return OrderSummaryState(
        addressesRequestState:
            addressesRequestState ?? this.addressesRequestState,
        userAddresses: userAddresses ?? this.userAddresses);
  }

  @override
  List<Object> get props => [userAddresses!, addressesRequestState!];
}
