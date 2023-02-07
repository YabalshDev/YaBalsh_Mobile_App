import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/notifications/domain/entities/notification.dart'
    as yabalash;

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/utils/enums/search_navigation_screens.dart';
import '../../../../core/widgets/custom_network_image.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final yabalash.Notification notification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (notification.isClickable!) {
          Get.toNamed(RouteHelper.getSearchRoute(), arguments: [
            SearchNavigationScreens.sections,
            notification.section!.name,
            notification.section!.id
          ]);
        }
      },
      child: Container(
        decoration: kDefaultBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width,
              height: 116.h,
              child: AppImage(
                path: notification.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title!,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColorsLight.darkPurpleColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  mediumVerticalSpace,
                  Text(
                    notification.description ?? '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColorsLight.kDisabledButtonTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
