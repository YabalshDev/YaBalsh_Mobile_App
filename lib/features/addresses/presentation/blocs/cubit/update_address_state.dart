part of 'update_address_cubit.dart';

class UpdateAddressState extends Equatable {
  final bool? isButtonDisabled;
  final RequestState? addressState;
  final String? errorMessage;
  const UpdateAddressState(
      {this.isButtonDisabled = true,
      this.addressState = RequestState.idle,
      this.errorMessage = ''});

  UpdateAddressState copyWith(
      {bool? isButtonDisabled,
      RequestState? addressState,
      String? errorMessage}) {
    return UpdateAddressState(
        addressState: addressState ?? this.addressState,
        errorMessage: errorMessage ?? this.errorMessage,
        isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled);
  }

  @override
  List<Object> get props => [addressState!, errorMessage!, isButtonDisabled!];
}
