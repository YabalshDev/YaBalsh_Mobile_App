import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/enums/request_state.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../domain/entities/address_request.dart';
import '../../../domain/use cases/add_address_usecase.dart';
import '../../../domain/use cases/edit_address_usecase.dart';

part 'update_address_state.dart';

class UpdateAddressCubit extends Cubit<UpdateAddressState> {
  UpdateAddressCubit(
      {required this.addAddressUseCase, required this.editAddressUseCase})
      : super(const UpdateAddressState());
  final AddAddressUseCase addAddressUseCase;
  final EditAddressUseCase editAddressUseCase;

  void changeButtonDisability(bool value) {
    emit(state.copyWith(isButtonDisabled: value));
  }

  void addAddress(
      {required AddressRequest addressRequest,
      required String fromRoute}) async {
    final response = await addAddressUseCase(
        AddAddressParams(addressRequest: addressRequest));
    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message, addressState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    },
        (address) => yaBalashCustomDialog(
            buttonTitle: 'حسنا',
            isWithEmoji: false,
            title: 'ملاحظة',
            mainContent: 'تمت اضافة العنوان بنجاح',
            onConfirm: () => Get
              ..back()
              ..offNamed(fromRoute)));
  }

  void editAddress(
      {required int id,
      required AddressRequest addressRequest,
      required String fromRoute}) async {
    final response = await editAddressUseCase(
        EditAddressParams(addressRequest: addressRequest, id: id));
    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message, addressState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    },
        (address) => yaBalashCustomDialog(
            buttonTitle: 'حسنا',
            isWithEmoji: false,
            title: 'ملاحظة',
            mainContent: 'تم تعديل العنوان بنجاح',
            onConfirm: () {
              Get
                ..back()
                ..offNamed(fromRoute);
            }));
  }
}
