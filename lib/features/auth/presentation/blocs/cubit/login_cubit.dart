import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(const LoginState());

  void loginUser({required LoginRequestModel loginCredentials}) async {
    emit(state.copyWith(loginState: RequestState.loading));
    final response =
        await loginUseCase(LoginParams(loginRequest: loginCredentials));
    response.fold((faiulre) {
      // show error message to user
      emit(state.copyWith(
          errorMessage: faiulre.message, loginState: RequestState.error));
      print(faiulre.message);
    }, (token) {
      emit(state.copyWith(errorMessage: '', loginState: RequestState.loaded));
      // save user token
      // get user data
      // navigate to home
    });
  }

  void changeObsecure(bool value) {
    emit(state.copyWith(obsecure: value));
  }

  void changeButtonDisabled(bool value) {
    emit(state.copyWith(isButtonDisabled: value));
  }
}
