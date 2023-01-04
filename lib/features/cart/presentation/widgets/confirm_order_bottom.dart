import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../../orders/data/models/order_product_model.dart';
import '../../../orders/domain/entities/order_request.dart';
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
    return CustomNavBar(
      isButtonSecondary: false,
      mainButtonTap: () async {
        final OrderRequest orderRequest = OrderRequest(
            addressId: state.userAddress?.id,
            storeId: state.supermarket?.store!.id,
            products: state.cartItems!
                .map((e) =>
                    OrderProductModel(id: e.product!.id, quantity: e.quantity))
                .toList());
        if (state.userAddress?.id != null) {
          final order = await getIt<OrderSummaryCubit>()
              .placeOrder(orderRequest: orderRequest);
          if (order != null) {
            Get.toNamed(RouteHelper.getOrderSuccessRoute(), arguments: [order]);
          }
        }
      },
      title: '✔  خلص الطلب',
      isDisabled: state.userAddress?.id == null,
    );
  }
}
