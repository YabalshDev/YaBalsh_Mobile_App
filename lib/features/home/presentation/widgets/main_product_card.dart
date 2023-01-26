import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/utils/calculate_product_savings.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_network_image.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/saving_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/cart_quantity_row.dart';
import '../../../cart/domain/entities/cart_item.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';

class MainProductCard extends StatelessWidget {
  final Product product;
  const MainProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.toNamed(RouteHelper.getProductDetailsRoute(), arguments: product),
      child: Container(
        width: 156.w,
        decoration: kDefaultBoxDecoration.copyWith(
          color: AppColorsLight.kOffwhiteColor,
        ),
        margin: EdgeInsets.only(left: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductDetailsCard(product: product),
            smallVerticalSpace,
            Container(
              height: 40.h,
              padding: kDefaultPadding,
              decoration: kDefaultBoxDecoration.copyWith(
                  border: Border.all(color: Colors.transparent)),
              child: product.prices!.entries.last.value.price == 0
                  ? const SizedBox()
                  : MostExpensiveRow(product: product),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      padding: kDefaultPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kDefaultBorderRaduis,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEEEEEE),
            blurRadius: 0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                  height: 163.h,
                  width: 137.w,
                  child: AppImage(
                    fit: BoxFit.fill,
                    path: product.imagePath!,
                  )),
              Positioned(
                  top: 0,
                  left: 0,
                  child: calculateSavingsPercentage(product) <= 0
                      ? const SizedBox()
                      : SavingCard(
                          percentage: calculateSavingsPercentage(product)
                              .toStringAsFixed(0))),
              ProductQuantitySection(product: product)
            ],
          ),
          SizedBox(
            height: 40.h,
            child: Text(
              product.name!,
              maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColorsLight.kAppPrimaryColorLight,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          product.prices!.entries.first.value.price == 0
              ? SizedBox(
                  height: 20.h,
                )
              : CheapestPriceRow(product: product)
        ],
      ),
    );
  }
}

class MostExpensiveRow extends StatelessWidget {
  const MostExpensiveRow({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'جنيه ${product.prices!.entries.last.value.price}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 11.sp,
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
              fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        SizedBox(
          height: 25.h,
          width: 60.w,
          child: AppImage(
            fit: BoxFit.contain,
            path: product.prices!.entries.last.value.storeImagePath ?? '',
          ),
        ),
      ],
    );
  }
}

class CheapestPriceRow extends StatelessWidget {
  const CheapestPriceRow({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'جنيه ${product.prices!.entries.first.value.price}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 13.sp,
              color: AppColorsLight.kAppPrimaryColorLight,
              fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        SizedBox(
          height: 25.h,
          width: 60.w,
          child: AppImage(
            fit: BoxFit.contain,
            path: product.prices!.entries.first.value.storeImagePath ?? '',
          ),
        ),
      ],
    );
  }
}

class ProductQuantitySection extends StatelessWidget {
  const ProductQuantitySection({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartItem? cartItem;
        bool isExist = getIt<CartCubit>().checkIfItemisInCart(product);

        if (isExist) {
          cartItem = state.cartItems!
              .firstWhere((element) => element.product!.id == product.id);
          return Positioned(
            top: 120.h,
            child: Container(
              height: 40.h,
              width: 120.w,
              color: Colors.white.withOpacity(0.8),
              child: Row(
                children: [
                  const Spacer(),
                  CartQuantityRow(
                      onDecrement: () {
                        getIt<CartCubit>().decrementQuantity(product);
                      },
                      onDelete: () {
                        getIt<CartCubit>().deleteItemFromCart(product);
                      },
                      onIncrement: () {
                        getIt<CartCubit>().incrementQuantity(product);
                      },
                      quantity: cartItem.quantity!),
                  const Spacer()
                ],
              ),
            ),
          );
        } else {
          return Positioned(
            top: 120.h,
            left: 0,
            child: InkWell(
              onTap: () => getIt<CartCubit>().addItemToCart(product),
              child: Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple.shade700),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20.sp,
                  )),
            ),
          );
        }
      },
    );
  }
}
