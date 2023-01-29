import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order_response_product.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../domain/entities/cart_item.dart';
import '../blocs/cubit/cart_cubit.dart';

class OrderDetailsSection extends StatelessWidget {
  final List<OrderResponseProduct>? orderProducts;
  const OrderDetailsSection({super.key, this.orderProducts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orderProducts != null
          ? orderProducts!.length
          : getIt<CartCubit>().state.cartItems!.length,
      itemBuilder: (context, index) {
        CartItem? cartItem;
        double? productPrice;
        double? totalPrice;
        OrderResponseProduct? orderProduct;
        if (orderProducts != null) {
          orderProduct = orderProducts![index];
        } else {
          cartItem = getIt<CartCubit>().state.cartItems![index];
          productPrice = cartItem
              .product!
              .prices![getIt<CartCubit>().state.supermarket!.store!.name]!
              .price!;
          totalPrice = (cartItem.quantity! * productPrice);
        }
        return Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Row(
            children: [
              // change to network when ready
              CustomCard(
                withBorder: true,
                isAssetImage: false,
                width: 54.w,
                height: 54.h,
                imagePath: orderProducts != null
                    ? orderProduct!.imagePath
                    : cartItem!.product!.imagePath,
              ),
              mediumHorizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 195.w),
                    child: Text(
                      orderProducts != null
                          ? orderProduct!.name!
                          : cartItem!.product!.name!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  mediumVerticalSpace,
                  Text(
                    '300 مل',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 9.sp,
                        color: AppColorsLight.kAppPrimaryColorLight,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${orderProducts != null ? orderProduct!.price! : totalPrice!.toStringAsFixed(0)} جنيه',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: AppColorsLight.kAppPrimaryColorLight),
                  ),
                  Row(
                    children: [
                      Text(
                        '${orderProducts != null ? orderProduct!.quantity : cartItem!.quantity}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorsLight.kAppPrimaryColorLight
                                  .withOpacity(0.7),
                            ),
                      ),
                      Text(
                        ' x ',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorsLight.kAppPrimaryColorLight
                                  .withOpacity(0.7),
                            ),
                      ),
                      Text(
                        ' ${orderProducts != null ? orderProduct!.price : productPrice!.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorsLight.kAppPrimaryColorLight
                                  .withOpacity(0.7),
                            ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
