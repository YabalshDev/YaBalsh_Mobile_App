import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../blocs/cubit/cart_cubit.dart';
import '../blocs/cubit/order_summary_cubit.dart';

class ConfirmOrderBottom extends StatelessWidget {
  final CartState state;
  const ConfirmOrderBottom({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
        builder: (context, orderSummaryState) {
      return CustomNavBar(
        isButtonSecondary: false,
        mainButtonTap: () async {
          print(orderSummaryState.isPromoValid);
          // final OrderRequest orderRequest = OrderRequest(
          //     addressId: state.userAddress?.id ??
          //         getIt<AddressService>().primaryAddress.id,
          //     storeId: state.supermarket?.store!.id,
          //     products: state.cartItems!
          //         .map((e) =>
          //             OrderProductModel(id: e.product!.id, quantity: e.quantity))
          //         .toList());
          // if (state.userAddress?.id != null) {
          //   final order = await getIt<OrderSummaryCubit>()
          //       .placeOrder(orderRequest: orderRequest);
          //   if (order != null) {
          //     Get.toNamed(RouteHelper.getOrderSuccessRoute(),
          //         arguments: [order, false]);
          //   }
          // }
        },
        title: '✔  خلص الطلب',
        isDisabled: state.userAddress?.id == null,
      );
    });
  }
}
