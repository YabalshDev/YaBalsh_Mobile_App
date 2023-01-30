import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/services/promo_service.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/utils/get_zone_addresses.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/get_all_addresses_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';
import 'package:yabalash_mobile_app/features/orders/domain/usecases/create_order_usecase.dart';

import '../../../../../core/services/addresses_service.dart';
import '../../../../../core/services/order_service.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../addresses/domain/entities/address.dart';
import '../../../../orders/domain/entities/order.dart';
import '../../../../orders/domain/entities/order_request.dart';
import 'cart_cubit.dart';

part 'order_summary_state.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  final GetAllAddressUseCase getAllAddressUseCase;
  final CreateOrderUseCase createOrderUseCase;
  final PromoService promoService;
  OrderSummaryCubit(
      {required this.createOrderUseCase,
      required this.promoService,
      required this.getAllAddressUseCase})
      : super(const OrderSummaryState());

  SuperMarketCardModel get supermarket =>
      getIt<OrderService>().superMarketCardModel!;

  void getUserAddress() async {
    final primaryAddress = getIt<AddressService>().primaryAddress;
    // if primary address set load it
    if (primaryAddress.id != null) {
      getIt<CartCubit>().changeSelectedUserAddress(primaryAddress);
      emit(state.copyWith(
          addressesRequestState: RequestState.loaded,
          userAddresses: [primaryAddress]));
    } else {
      //otherwise load all address for user
      final response = await getAllAddressUseCase(NoParams());

      response.fold((failure) {
        emit(state.copyWith(addressesRequestState: RequestState.error));
        getIt<CartCubit>().changeSelectedUserAddress(const Address());
        yaBalashCustomDialog(
          isWithEmoji: false,
          buttonTitle: 'حسنا',
          mainContent: failure.message,
          title: 'خطأ',
          onConfirm: () => Get.back(),
        );
      }, (addresses) {
        if (addresses.isNotEmpty) {
          final zoneAddresses = getZoneAddress(addresses);
          getIt<AddressService>()
              .setAddresses(zoneAddresses); // set service for global use

          getIt<CartCubit>().changeSelectedUserAddress(zoneAddresses.last);
        }
        emit(state.copyWith(
            addressesRequestState: RequestState.loaded,
            userAddresses: addresses));
      });
    }
  }

  void changePromoValidation(bool value) {
    promoService.setPromoValidity(value);
    emit(state.copyWith(isPromoValid: value));
  }

  Future<Order>? placeOrder({required OrderRequest orderRequest}) async {
    Order orderResult = const Order();

    if (promoService.isPromoValid) {
      final response = await createOrderUseCase(
          CreateOrderParams(orderRequest: orderRequest));

      response.fold((failure) {
        yaBalashCustomDialog(
          isWithEmoji: false,
          buttonTitle: 'حسنا',
          mainContent: 'حدث مشكلة اثناء تنفيذ الطلب',
          title: 'خطأ',
          onConfirm: () => Get.back(),
        );
      }, (order) {
        orderResult = order;
      });
    }

    return orderResult;
  }
}
