import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(const PhoneNumberState());

  void changeButtonDisabled(bool value) {
    emit(state.copyWith(isButtonDisabled: value));
  }
}
