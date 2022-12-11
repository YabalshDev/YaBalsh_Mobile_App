part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final bool? obsecure;
  final bool? isButtonDisabled;
  final RequestState? registerState;
  final String? errorMessage;
  final bool? formValidationError;

  const RegisterState(
      {this.obsecure = true,
      this.errorMessage = '',
      this.isButtonDisabled = true,
      this.formValidationError = false,
      this.registerState = RequestState.idle});

  RegisterState copyWith(
      {bool? obsecure,
      bool? isButtonDisabled,
      RequestState? registerState,
      String? errorMessage,
      bool? formValidationError}) {
    return RegisterState(
        isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled,
        registerState: registerState ?? this.registerState,
        obsecure: obsecure ?? this.obsecure,
        errorMessage: errorMessage ?? this.errorMessage,
        formValidationError: formValidationError ?? this.formValidationError);
  }

  @override
  List<Object> get props => [
        obsecure!,
        isButtonDisabled!,
        registerState!,
        errorMessage!,
        formValidationError!
      ];
}

class RegisterInitial extends RegisterState {}
