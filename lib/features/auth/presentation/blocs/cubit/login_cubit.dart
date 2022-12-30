import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final AuthRepository authRepository;
  LoginCubit({required this.authRepository, required this.loginUseCase})
      : super(const LoginState());

  void loginUser({required LoginRequestModel loginCredentials}) async {
    emit(state.copyWith(loginState: RequestState.loading));
    final response =
        await loginUseCase(LoginParams(loginRequest: loginCredentials));
    response.fold((faiulre) {
      // show error message to user
      emit(state.copyWith(
          errorMessage: faiulre.message, loginState: RequestState.error));
      yaBalashCustomDialog(
          isWithEmoji: false,
          buttonTitle: 'حسنا',
          onConfirm: () => Get.back(),
          title: 'خطا في البيانات',
          mainContent: 'رقم الهاتف او كلمة المرور غير صحيحة');
    }, (data) {
      emit(state.copyWith(errorMessage: '', loginState: RequestState.loaded));
      // save user token
      authRepository.saveUserToken(token: data.token!);
      // get user data
      // navigate to home
      Get.offAllNamed(RouteHelper.getMainNavigationRoute(), arguments: 0);
    });
  }

  void changeObsecure(bool value) {
    emit(state.copyWith(obsecure: value));
  }

  void changeButtonDisabled(bool value) {
    emit(state.copyWith(isButtonDisabled: value));
  }
}
