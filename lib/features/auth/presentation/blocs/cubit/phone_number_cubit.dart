import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/check_user_registered_usecase.dart';

import '../../../../../core/routes/app_routes.dart';

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  final CheckUserRegisteredUseCase checkUserRegisteredUseCase;
  PhoneNumberCubit({required this.checkUserRegisteredUseCase})
      : super(const PhoneNumberState());

  void changeButtonDisabled(bool value) {
    emit(state.copyWith(isButtonDisabled: value));
  }

  bool isFormHasError(String formValue) {
    bool hasError = false;
    if (formValue.length < 10) {
      hasError = true;
      emit(state.copyWith(formErrorMessage: 'رقم الهاتف لازم يكون 10 ارقام'));
    } else {
      emit(state.copyWith(formErrorMessage: ''));
    }
    return hasError;
  }

  Future<bool> isUserRegistered({required String phoneNumber}) async {
    bool isRegistered = false;

    final response = await checkUserRegisteredUseCase(
        CheckUserRegisteredParams(phoneNumber: phoneNumber));

    response.fold((failure) {
      emit(state.copyWith(hasError: true));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () {
          Get.back();
        },
      );
    }, (result) {
      emit(state.copyWith(hasError: false));
      isRegistered = result;
    });

    return isRegistered;
  }

  void handlePhoneFormSubmission(
      {required String phoneNumber, required String fromRoute}) async {
    final hasError = isFormHasError(phoneNumber);
    if (!hasError) {
      final isUserExist = await isUserRegistered(phoneNumber: phoneNumber);

      if (!state.hasError!) {
        if (isUserExist) {
          Get.toNamed(RouteHelper.getLoginRoute(),
              arguments: [phoneNumber, fromRoute]);
        } else {
          Get.toNamed(RouteHelper.getRegisterRoute(),
              arguments: [phoneNumber, fromRoute]);
        }
      }
    }
  }
}
