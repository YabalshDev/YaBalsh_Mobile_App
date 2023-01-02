part of 'phone_number_cubit.dart';

class PhoneNumberState extends Equatable {
  final bool? isButtonDisabled;
  final String? formErrorMessage;
  final bool? hasError;
  const PhoneNumberState(
      {this.isButtonDisabled = true,
      this.formErrorMessage = '',
      this.hasError = false});

  PhoneNumberState copyWith(
      {bool? isButtonDisabled, String? formErrorMessage, bool? hasError}) {
    return PhoneNumberState(
        hasError: hasError ?? this.hasError,
        isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled,
        formErrorMessage: formErrorMessage ?? this.formErrorMessage);
  }

  @override
  List<Object> get props => [isButtonDisabled!, formErrorMessage!, hasError!];
}
