import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../domain/entities/shopping_list.dart';

class ShoppingListCard extends StatelessWidget {
  final ShoppingList shoppingList;
  const ShoppingListCard({super.key, required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 65.h,
                height: 65.h,
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                decoration: kDefaultBoxDecoration.copyWith(
                    border: Border.all(color: Colors.transparent),
                    color: AppColorsLight.kDisabledButtonColor),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 3,
                  children: shoppingList.products!
                      .sublist(0, 4)
                      .map((cartItem) => CustomCard(
                            withBorder: false,
                            isAssetImage: true,
                            borderRadius: 8,
                            backgroundColor: Colors.white,
                            width: 30.w,
                            height: 25.h,
                            imagePath: cartItem.product!.imagePath,
                          ))
                      .toList(),
                )),
            mediumHorizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoppingList.name!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColorsLight.kAppPrimaryColorLight),
                ),
                mediumVerticalSpace,
                Text(
                  '${shoppingList.products!.length} منتجات',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColorsLight.kAppPrimaryColorLight
                          .withOpacity(0.6)),
                )
              ],
            ),
          ],
        ),
        const Spacer(),
        Icon(
          Icons.arrow_forward_ios,
          size: 15.h,
          color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.8),
        )
      ],
    );
  }
}
