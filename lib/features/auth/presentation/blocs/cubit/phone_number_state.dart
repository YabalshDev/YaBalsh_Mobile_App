part of 'phone_number_cubit.dart';

class PhoneNumberState extends Equatable {
  final bool? isButtonDisabled;
  const PhoneNumberState({this.isButtonDisabled = true});

  PhoneNumberState copyWith({
    bool? isButtonDisabled,
  }) {
    return PhoneNumberState(
      isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled,
    );
  }

  @override
  List<Object> get props => [isButtonDisabled!];
}
