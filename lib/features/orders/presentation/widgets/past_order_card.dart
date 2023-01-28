import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_card.dart';

class PastOrderCard extends StatelessWidget {
  final Order order;
  const PastOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteHelper.getOrderSuccessRoute(),
          arguments: [order, true]),
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        padding: kDefaultPadding,
        decoration: kDefaultBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCard(
                      withBorder: true,
                      isAssetImage: false,
                      imagePath: order.store!.logoImagePath,
                    ),
                    smallHorizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'طلبك من  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Colors.black, fontSize: 10.sp)),
                            TextSpan(
                                text: order.store!.name ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: AppColorsLight
                                            .kAppPrimaryColorLight,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp)),
                          ]),
                        ),
                        mediumVerticalSpace,
                        Text(
                          '${order.products!.length} منتحات',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColorsLight.kAppPrimaryColorLight
                                      .withOpacity(0.8),
                                  fontSize: 9.sp),
                        )
                      ],
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 11.h,
                  color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.8),
                )
              ],
            ),
            mediumVerticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PastOrderColumn(
                    title: 'الاجمالي',
                    subTitle: '${order.subTotal!.toStringAsFixed(0)} جنيه'),
                PastOrderColumn(
                    title: 'تاريخ الطلب',
                    subTitle:
                        DateFormat('dd-MM-yyyy').format(order.orderDate!)),
                PastOrderColumn(
                    title: 'رقم الطلب', subTitle: '#834555${order.id}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PastOrderColumn extends StatelessWidget {
  final String title;
  final String subTitle;
  const PastOrderColumn(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7),
                fontWeight: FontWeight.w700,
                fontSize: 12.sp)),
        Text(subTitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp))
      ],
    );
  }
}
