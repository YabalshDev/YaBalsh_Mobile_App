import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/utils/date_time_utils.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../domain/entities/order.dart';

class OrderSuccessBody extends StatelessWidget {
  final Order order;
  const OrderSuccessBody({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () =>
                    Get.offAndToNamed(RouteHelper.getMainNavigationRoute()),
                child: const CustomSvgIcon(
                  iconPath: AppAssets.closeIcon,
                  color: AppColorsLight.kAppPrimaryColorLight,
                ),
              ),
              mediumVerticalSpace,
              Text(
                'رقم الطلب #86988378${order.id}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey.shade500),
              ),
              mediumVerticalSpace,
              StatusCard(
                status: order.status ?? '',
              ),
              largeVerticalSpace,
              Text(
                'وقت الوصول المتوقع',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              smallVerticalSpace,
              Text(
                generateExpectedTime(order.orderDate!, 30),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 17.sp,
                      color: AppColorsLight.kAppPrimaryColorLight,
                    ),
              ),
              const SizedBox(
                width: 500,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String status;
  const StatusCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kDefaultBoxDecoration.copyWith(
          color: AppColorsLight.warningColor,
          border: Border.all(color: Colors.transparent)),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Text(
        status == 'pending' ? "قيد التوصيل" : '',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
