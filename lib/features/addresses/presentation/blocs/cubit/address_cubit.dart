import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address_request.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/add_address_usecase.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/delete_address_usecase.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/edit_address_usecase.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/get_all_addresses_usecase.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetAllAddressUseCase getAllAddressUseCase;
  final AddAddressUseCase addAddressUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;
  final EditAddressUseCase editAddressUseCase;
  AddressCubit(
      {required this.getAllAddressUseCase,
      required this.addAddressUseCase,
      required this.deleteAddressUseCase,
      required this.editAddressUseCase})
      : super(const AddressState());

  void getAllAddress() async {
    final response = await getAllAddressUseCase(NoParams());
    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          addressesRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    },
        (addresses) => emit(state.copyWith(
            addresses: addresses, addressesRequestState: RequestState.loaded)));
  }

  void addAddress({required AddressRequest addressRequest}) async {
    final response = await addAddressUseCase(
        AddAddressParams(addressRequest: addressRequest));
    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          addressesRequestState: RequestState.error));
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
              onConfirm: () => Get.back(),
            ));
  }

  void editAddress(
      {required int id, required AddressRequest addressRequest}) async {
    final response = await editAddressUseCase(
        EditAddressParams(addressRequest: addressRequest, id: id));
    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          addressesRequestState: RequestState.error));
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
              onConfirm: () => Get.back(),
            ));
  }

  void deleteAddress({required int id}) async {
    final response = await deleteAddressUseCase(DeleteAddressParams(id: id));
    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          addressesRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    },
        (success) => yaBalashCustomDialog(
              buttonTitle: 'حسنا',
              isWithEmoji: false,
              title: 'ملاحظة',
              mainContent: 'تم حذف العنوان بنجاح',
              onConfirm: () => Get.back(),
            ));
  }
}
