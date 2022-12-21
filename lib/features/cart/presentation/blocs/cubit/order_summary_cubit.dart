import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/get_all_addresses_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';

import '../../../../../core/services/addresses_service.dart';
import '../../../../../core/services/order_service.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../addresses/domain/entities/address.dart';
import 'cart_cubit.dart';

part 'order_summary_state.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  final GetAllAddressUseCase getAllAddressUseCase;
  OrderSummaryCubit({required this.getAllAddressUseCase})
      : super(const OrderSummaryState());

  SuperMarketCardModel get supermarket =>
      getIt<OrderService>().superMarketCardModel!;

  void getUserAddress() async {
    final response = await getAllAddressUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(addressesRequestState: RequestState.error));
      getIt<CartCubit>().changeCanConfirmOrder(false);
      yaBalashCustomDialog(
        isWithEmoji: false,
        buttonTitle: 'حسنا',
        mainContent: failure.message,
        title: 'خطأ',
        onConfirm: () => Get.back(),
      );
    }, (addresses) {
      getIt<AddressService>()
          .setAddresses(addresses); // set service for global use

      getIt<CartCubit>().changeCanConfirmOrder(true);
      emit(state.copyWith(
          addressesRequestState: RequestState.loaded,
          userAddresses: addresses));
    });
  }
}
