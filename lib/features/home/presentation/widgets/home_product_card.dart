import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/saving_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/cart_quantity_row.dart';
import '../../../cart/domain/entities/cart_item.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';

class HomeProductCard extends StatelessWidget {
  final Product product;
  const HomeProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.toNamed(RouteHelper.getProductDetailsRoute(), arguments: product),
      child: Container(
        margin: EdgeInsets.only(left: 20.w),
        child: Stack(
          children: [
            Container(
              width: 133.w,
              height: 290.h,
              decoration: kDefaultBoxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 44.h,
                    width: 133.w,
                    // color: AppColorsLight.kOffwhiteColor,
                    padding: kDefaultPadding,
                    decoration: kDefaultBoxDecoration.copyWith(
                        color: AppColorsLight.kOffwhiteColor,
                        border: Border.all(color: Colors.transparent)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'جنيه ${product.prices!['كارفور']!.price!}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 11.sp,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Image.asset(
                                product.prices!['كارفور']!.storeImagePath!)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 133.w,
                padding: kDefaultPadding,
                decoration: kDefaultBoxDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                            height: 140.h,
                            width: 133.h,
                            child: Image.asset(product.imagePath!)),
                        const Positioned(
                            top: 0,
                            left: 0,
                            child: SavingCard(percentage: '20')),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            CartItem? cartItem;
                            bool isExist =
                                getIt<CartCubit>().checkIfItemisInCart(product);

                            if (isExist) {
                              cartItem = state.cartItems!.firstWhere(
                                  (element) =>
                                      element.product!.id == product.id);
                              return Positioned(
                                top: 100.h,
                                child: Container(
                                  height: 40.h,
                                  width: 120.w,
                                  color: Colors.white.withOpacity(0.8),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      CartQuantityRow(
                                          quantity: cartItem.quantity!),
                                      const Spacer()
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Positioned(
                                top: 100.h,
                                left: 0,
                                child: InkWell(
                                  onTap: () =>
                                      getIt<CartCubit>().addItemToCart(product),
                                  child: Container(
                                      padding: EdgeInsets.all(5.w),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.purple.shade700),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20.sp,
                                      )),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      product.name!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'جنيه ${product.prices!['كارفور']!.price!}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 13.sp,
                                    color: AppColorsLight.kAppPrimaryColorLight,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Image.asset(
                                product.prices!['كارفور']!.storeImagePath!)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
