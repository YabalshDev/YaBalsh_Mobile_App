import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/utils/get_zone_addresses.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/delete_address_usecase.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/get_all_addresses_usecase.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetAllAddressUseCase getAllAddressUseCase;

  final DeleteAddressUseCase deleteAddressUseCase;

  AddressCubit({
    required this.getAllAddressUseCase,
    required this.deleteAddressUseCase,
  }) : super(const AddressState());

  void setIsPrimary(int index) {
    emit(state.copyWith(currentAddressIndex: index));
  }

  void handleDeleteDialogClose() {
    emit(state.copyWith(
        addresses: state.addresses, addressesRequestState: RequestState.error));

    emit(state.copyWith(
        addresses: state.addresses,
        addressesRequestState: RequestState.loaded));
  }

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
        onConfirm: () {
          Get.back();
        },
      );
    }, (addresses) {
      final zoneAddresses = getZoneAddress(addresses);
      emit(state.copyWith(
          addresses: zoneAddresses,
          addressesRequestState: RequestState.loaded));
    });
  }

  void deleteAddress({required int id, required Address address}) async {
    List<Address> updatedAddress = List.from(state.addresses!)..remove(address);

    final response = await deleteAddressUseCase(DeleteAddressParams(id: id));
    response.fold((failure) {
      handleDeleteDialogClose();
      yaBalashCustomDialog(
          buttonTitle: 'حسنا',
          isWithEmoji: false,
          title: 'خطأ',
          mainContent: failure.message,
          onConfirm: () => Get
            ..back()
            ..back());
    }, (success) {
      emit(state.copyWith(addresses: updatedAddress));
      yaBalashCustomDialog(
          buttonTitle: 'حسنا',
          isWithEmoji: false,
          title: 'ملاحظة',
          mainContent: 'تم حذف العنوان بنجاح',
          onConfirm: () => Get
            ..back()
            ..back());
    });
  }
}
