part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool? obsecure;
  final bool? isButtonDisabled;
  final RequestState? loginState;
  final String? errorMessage;

  const LoginState(
      {this.obsecure = true,
      this.errorMessage = '',
      this.isButtonDisabled = true,
      this.loginState = RequestState.idle});

  LoginState copyWith(
      {bool? obsecure,
      bool? isButtonDisabled,
      RequestState? loginState,
      String? errorMessage}) {
    return LoginState(
        isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled,
        loginState: loginState ?? this.loginState,
        obsecure: obsecure ?? this.obsecure,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props =>
      [obsecure!, isButtonDisabled!, loginState!, errorMessage!];
}
