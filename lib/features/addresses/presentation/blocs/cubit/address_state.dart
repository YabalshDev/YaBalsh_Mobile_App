part of 'address_cubit.dart';

class AddressState extends Equatable {
  final RequestState? addressesRequestState;
  final List<Address>? addresses;
  final String? errorMessage;
  final int? currentAddressIndex;
  const AddressState(
      {this.addressesRequestState = RequestState.loading,
      this.addresses = const [],
      this.currentAddressIndex = -1,
      this.errorMessage = ''});

  AddressState copyWith(
      {RequestState? addressesRequestState,
      List<Address>? addresses,
      int? currentAddressIndex,
      String? errorMessage}) {
    return AddressState(
        addresses: addresses ?? this.addresses,
        currentAddressIndex: currentAddressIndex ?? this.currentAddressIndex,
        addressesRequestState:
            addressesRequestState ?? this.addressesRequestState,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props =>
      [addresses!, addressesRequestState!, errorMessage!, currentAddressIndex!];
}
