import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(const PhoneNumberState());

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
}
