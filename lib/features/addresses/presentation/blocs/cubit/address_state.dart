part of 'address_cubit.dart';

class AddressState extends Equatable {
  final RequestState? addressesRequestState;
  final List<Address>? addresses;
  final String? errorMessage;
  const AddressState(
      {this.addressesRequestState = RequestState.loading,
      this.addresses = const [],
      this.errorMessage = ''});

  AddressState copyWith(
      {RequestState? addressesRequestState,
      List<Address>? addresses,
      String? errorMessage}) {
    return AddressState(
        addresses: addresses ?? this.addresses,
        addressesRequestState:
            addressesRequestState ?? this.addressesRequestState,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props => [addresses!, addressesRequestState!, errorMessage!];
}
