import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';

void showCustomDialog(
    {String? title,
    String? mainContent,
    String? subContent,
    String? buttonTitle,
    void Function()? onConfirm,
    bool? isWithEmoji}) {
  Get.defaultDialog(
      contentPadding: kDefaultPadding,
      title: '',
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? '',
                style: Get.theme.textTheme.bodyLarge!
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.close,
                  color: AppColorsLight.kAppPrimaryColorLight,
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
          largeVerticalSpace,
          isWithEmoji!
              ? Text(
                  '😔',
                  style: TextStyle(fontSize: 60.sp),
                )
              : const SizedBox(),
          mediumVerticalSpace,
          Text(
            mainContent ?? '',
            style: Get.theme.textTheme.bodyMedium!
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          mediumVerticalSpace,
          subContent != null
              ? Text(
                  subContent,
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600]),
                )
              : const SizedBox(),
          mediumVerticalSpace,
          YaBalashCustomButton(
              onTap: onConfirm!, child: Text(buttonTitle ?? ''))
        ],
      ));
}

void yaBalashCustomDialog(
    {String? title,
    String? mainContent,
    String? subContent,
    String? buttonTitle,
    void Function()? onConfirm,
    void Function()? onClose,
    bool? isWithEmoji}) {
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        titlePadding: kDefaultPadding,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            largeVerticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? '',
                  style: Get.theme.textTheme.bodyLarge!
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: onClose ?? () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  ),
                )
              ],
            ),
            largeVerticalSpace,
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
          ],
        ),
        contentPadding: kDefaultPadding,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isWithEmoji! ? mediumVerticalSpace : const SizedBox(),
            isWithEmoji
                ? Text(
                    '😔',
                    style: TextStyle(fontSize: 60.sp),
                  )
                : const SizedBox(),
            mediumVerticalSpace,
            Text(
              mainContent ?? '',
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            subContent != null
                ? Text(
                    subContent,
                    textAlign: TextAlign.center,
                    style: Get.theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600]),
                  )
                : const SizedBox(),
            mediumVerticalSpace,
            YaBalashCustomButton(
                onTap: onConfirm!, child: Text(buttonTitle ?? '')),
            largeVerticalSpace
          ],
        ),
      );
    },
  );
}
