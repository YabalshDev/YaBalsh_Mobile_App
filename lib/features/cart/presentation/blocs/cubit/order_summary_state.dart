part of 'order_summary_cubit.dart';

class OrderSummaryState extends Equatable {
  final List<Address>? userAddresses;
  final RequestState? addressesRequestState;
  final bool? isPromoValid;

  const OrderSummaryState(
      {this.userAddresses = const [],
      this.isPromoValid = true,
      this.addressesRequestState = RequestState.loading});

  OrderSummaryState copyWith(
      {List<Address>? userAddresses,
      RequestState? addressesRequestState,
      bool? isPromoValid}) {
    return OrderSummaryState(
        isPromoValid: isPromoValid ?? this.isPromoValid,
        addressesRequestState:
            addressesRequestState ?? this.addressesRequestState,
        userAddresses: userAddresses ?? this.userAddresses);
  }

  @override
  List<Object> get props =>
      [userAddresses!, addressesRequestState!, isPromoValid!];
}
