import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/cart_quantity_row.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';
import '../../../home/domain/entities/product.dart';
import 'product_notification_ring.dart';

class ProductCartQuantity extends StatelessWidget {
  final Product product;
  const ProductCartQuantity({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartItem = getIt<CartCubit>().state.cartItems!.firstWhere(
          (element) => element.product!.id == product.id,
        );
    return Container(
      padding: kDefaultPadding,
      child: Row(
        children: [
          const ProductNotificationRing(),
          mediumHorizontalSpace,
          const Spacer(),
          CartQuantityRow(
            quantity: cartItem.quantity!,
            fromProductDetails: true,
            onIncrement: () => getIt<CartCubit>().incrementQuantity(product),
            onDecrement: () => getIt<CartCubit>().decrementQuantity(product),
            onDelete: () => getIt<CartCubit>().deleteItemFromCart(product),
          ),
          const Spacer(),
          InkWell(
            onTap: () => getIt<CartCubit>().deleteItemFromCart(product),
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: kDefaultBoxDecoration.copyWith(
                  color: AppColorsLight.kErrorColor,
                  border: Border.all(color: Colors.transparent)),
              child: Center(
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 15.h,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
