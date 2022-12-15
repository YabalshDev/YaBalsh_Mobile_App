import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/register_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/register_usecase.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/enums/request_state.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit({required this.registerUseCase}) : super(const RegisterState());

  void registerUser({required RegisterRequestModel registerCredntials}) async {
    emit(state.copyWith(registerState: RequestState.loading));
    final response = await registerUseCase(
        RegisterParams(registerReguest: registerCredntials));

    response.fold((failure) {
      emit(state.copyWith(
          registerState: RequestState.loading, errorMessage: failure.message));

      yaBalashCustomDialog(
          buttonTitle: 'حسنا',
          isWithEmoji: false,
          title: 'مشكلة في انشاء الحساب',
          onConfirm: () => Get.back(),
          mainContent: failure.message);
    }, (customer) {
      emit(state.copyWith(registerState: RequestState.loaded));
      Get.toNamed(RouteHelper.getMainZonesRoute());
    });
  }

  void changeObsecure(bool value) {
    emit(state.copyWith(obsecure: value));
  }

  void changeButtonDisabled(bool value) {
    emit(state.copyWith(isButtonDisabled: value));
  }

  void changeFormFieldError(bool value) {
    emit(state.copyWith(formValidationError: value));
  }
}
