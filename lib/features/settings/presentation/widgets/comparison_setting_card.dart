import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../../core/widgets/custom_switch.dart';

class ComparisonSettingCard extends StatelessWidget {
  final void Function() onSwitchTap;
  final String title;
  final String iconPath;
  final bool activeIndicator;
  const ComparisonSettingCard(
      {super.key,
      required this.onSwitchTap,
      required this.title,
      required this.iconPath,
      required this.activeIndicator});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: false,
      waitDuration: const Duration(seconds: 5),
      message:
          'تفعيل هذه الخاصية يتيح لك التحكم في عرض السوبرماركتس للمنتج القريبة منك او لا ',
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: SizedBox(
        height: 56.h,
        child: ListTile(
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(
                'مفعلة',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: activeIndicator
                        ? Colors.green.shade400
                        : Colors.grey.shade300),
              ),
              CustomSwitch(
                activeIndicator: activeIndicator,
                onSwitchTap: onSwitchTap,
              )
            ]),
            title: Row(
              children: [
                CustomSvgIcon(
                  iconPath: iconPath,
                  width: 20.w,
                  height: 20.h,
                  boxFit: BoxFit.fill,
                  color: Colors.black,
                ),
                mediumHorizontalSpace,
                Text(title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        )),
              ],
            )),
      ),
    );
  }
}
