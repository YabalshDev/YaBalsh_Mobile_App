import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/utils/navigation_after_auth.dart';
import 'package:yabalash_mobile_app/core/utils/save_device.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/get_current_customer_usecase.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/login_usecase.dart';

import '../../../../../core/depedencies.dart';
import '../../../../../core/services/device_service.dart';
import '../../../../../core/services/user_service.dart';
import '../../../domain/entities/customer.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final AuthRepository authRepository;
  final GetCurrentCustomerUseCase getCurrentCustomerUseCase;

  LoginCubit(
      {required this.getCurrentCustomerUseCase,
      required this.authRepository,
      required this.loginUseCase})
      : super(const LoginState());

  void _handleDeviceRegisteration(String token) async {
    final device = getIt<DeviceService>().currentDevice;
    if (device != null && device.sendToBackend!) {
      final result = await getIt<DeviceService>()
          .registerDevice(deviceId: device.deviceId!, token: token);
      if (result) {
        saveDevice(
            sendToBackEnd:
                false); //if success change send to backend flag to false
      }
    }
  }

  void loginUser(
      {required LoginRequestModel loginCredentials,
      required String fromRoute}) async {
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
          title: 'خطا',
          mainContent: 'رقم الهاتف او كلمة المرور غير صحيحة');
    }, (data) async {
      emit(state.copyWith(errorMessage: '', loginState: RequestState.loaded));
      // save user token
      authRepository.saveUserToken(token: data.token!);
      // get user data
      final customer = await getCurrentCustomer();
      if (customer.id != null) {
        getIt<UserService>().setCurrentCustomer(customer);
        _handleDeviceRegisteration(data.token!);
        handleSuccessfullAuthNavigation(fromRoute);
        // navigation
      } else {
        emit(state.copyWith(
            errorMessage: 'فشل اثناء جلب بيانات المستخدم .. حاول مرة اخرى',
            loginState: RequestState.error));
      }
    });
  }

  Future<Customer> getCurrentCustomer() async {
    Customer currentCustomer = const Customer();
    final response = await getCurrentCustomerUseCase(NoParams());
    response.fold((failure) {}, (result) => currentCustomer = result);
    return currentCustomer;
  }

  void changeObsecure(bool value) {
    emit(state.copyWith(obsecure: value));
  }

  void changeButtonDisabled(bool value) {
    emit(state.copyWith(isButtonDisabled: value));
  }
}
