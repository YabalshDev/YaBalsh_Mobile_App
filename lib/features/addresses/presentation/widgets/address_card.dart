import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../domain/entities/address.dart';

class AddressCard extends StatelessWidget {
  final Address? address;
  final int index;
  const AddressCard({super.key, this.address, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('$index'),
      direction: DismissDirection.startToEnd,
      background: Container(
        decoration: const BoxDecoration(
          color: AppColorsLight.kErrorColor,
        ),
        padding: kDefaultPadding,
        child: Row(
          children: const [
            CustomSvgIcon(
              iconPath: AppAssets.binIcon,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: Container(
        decoration: kDefaultBoxDecoration.copyWith(
            border: Border.all(color: Colors.transparent)),
        height: 200.h,
        padding: kDefaultPadding,
        child: Container(
          padding: kDefaultPadding,
          decoration: kDefaultBoxDecoration.copyWith(
              color: AppColorsLight.kAddressBackgroundColor,
              border: Border.all(
                  color: AppColorsLight.kAddressBorderColor, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomSvgIcon(
                    iconPath: AppAssets.homeAddressIcon,
                    width: 18.w,
                    height: 18.h,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  ),
                  smallHorizontalSpace,
                  Text(
                    'بيت الشروق',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColorsLight.kAppPrimaryColorLight),
                  )
                ],
              ),
              mediumVerticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomSvgIcon(
                    iconPath: AppAssets.addressesIcon,
                    width: 18.w,
                    height: 18.h,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  ),
                  smallHorizontalSpace,
                  Text(
                    'حي البنفسج 4, التجمع الخامس، القاهرة',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: AppColorsLight.kAppPrimaryColorLight),
                  )
                ],
              ),
              mediumVerticalSpace,
              Text(
                '  ابن فضلان متفرع من يوسف عباس التجمع الخامس',
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color:
                        AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
              ),
              mediumVerticalSpace,
              Text(
                '  رقم المبني 62، رقم الدور 1, رقم الشقة 1',
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color:
                        AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
              ),
              mediumVerticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 18.w,
                        height: 18.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey.shade400, width: 2)),
                      ),
                      smallHorizontalSpace,
                      Text(
                        'عنوان اساسي',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColorsLight.kAppPrimaryColorLight
                                .withOpacity(0.7)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CustomSvgIcon(
                        iconPath: AppAssets.pencilIcon,
                        color: AppColorsLight.kAppPrimaryColorLight,
                      ),
                      smallHorizontalSpace,
                      Text(
                        'تغيير العنوان',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColorsLight.kAppPrimaryColorLight),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
