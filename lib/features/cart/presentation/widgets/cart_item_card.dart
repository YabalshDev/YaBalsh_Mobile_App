import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/cart_item.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../blocs/cubit/cart_cubit.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(cartItem),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        yaBalashCustomDialog(
          buttonTitle: 'تاكيد',
          isWithEmoji: false,
          onClose: () {
            getIt<CartCubit>().handleDeleteDialogOnClose();
            Get.back();
          },
          title: 'ملاحظة',
          mainContent: 'هل انت متاكد من حذف المنتج',
          onConfirm: () =>
              getIt<CartCubit>().deleteItemFromCart(cartItem.product!),
        );
      },
      background: Container(
          decoration: const BoxDecoration(
        color: AppColorsLight.kErrorColor,
      )),
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  withBorder: true,
                  imagePath: cartItem.product!.imagePath,
                ),
                mediumHorizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 180.w),
                      child: Text(
                        cartItem.product!.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColorsLight.kAppPrimaryColorLight,
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
              ],
            ),
            const Spacer(),
            Row(
              children: [
                cartItem.quantity == 1
                    ? const CustomSvgIcon(
                        iconPath: AppAssets.binIcon,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.remove,
                        color: Colors.red,
                        size: 18.h,
                      ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: kDefaultBoxDecoration.copyWith(
                      borderRadius: kSecondaryBorderRaduis),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '${cartItem.quantity}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(
                  Icons.add,
                  color: Colors.green.shade400,
                  size: 18.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
