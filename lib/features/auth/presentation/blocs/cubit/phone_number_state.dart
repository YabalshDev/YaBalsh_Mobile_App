part of 'phone_number_cubit.dart';

class PhoneNumberState extends Equatable {
  final bool? isButtonDisabled;
  final String? formErrorMessage;
  const PhoneNumberState(
      {this.isButtonDisabled = true, this.formErrorMessage = ''});

  PhoneNumberState copyWith(
      {bool? isButtonDisabled, String? formErrorMessage}) {
    return PhoneNumberState(
        isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled,
        formErrorMessage: formErrorMessage ?? this.formErrorMessage);
  }

  @override
  List<Object> get props => [isButtonDisabled!, formErrorMessage!];
}
