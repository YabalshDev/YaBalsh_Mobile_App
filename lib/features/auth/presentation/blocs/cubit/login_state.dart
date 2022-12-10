part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool? obsecure;
  final bool? isButtonDisabled;
  final RequestState? loginState;

  const LoginState(
      {this.obsecure = true,
      this.isButtonDisabled = true,
      this.loginState = RequestState.idle});

  LoginState copyWith({
    bool? obsecure,
    bool? isButtonDisabled,
    RequestState? loginState,
  }) {
    return LoginState(
        isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled,
        loginState: loginState ?? this.loginState,
        obsecure: obsecure ?? this.obsecure);
  }

  @override
  List<Object> get props => [obsecure!, isButtonDisabled!, loginState!];
}
