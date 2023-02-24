import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/services/app_settings_service.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class ComparisonSettingCard extends StatelessWidget {
  final void Function() onSwitchTap;
  const ComparisonSettingCard({super.key, required this.onSwitchTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ListTile(
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              'مفعلة',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: getIt<AppSettingsService>().appVersion == '1.0.0'
                      ? Colors.green.shade400
                      : Colors.grey.shade300),
            ),
            Platform.isAndroid
                ? Switch(
                    value: getIt<AppSettingsService>().appVersion == '1.0.0',
                    activeColor: Colors.green.shade400,
                    onChanged: (value) => onSwitchTap(),
                  )
                : CupertinoSwitch(
                    value: getIt<AppSettingsService>().appVersion == '1.0.0',
                    activeColor: Colors.green.shade400,
                    onChanged: (value) => onSwitchTap(),
                  )
          ]),
          title: Row(
            children: [
              CustomSvgIcon(
                iconPath: AppAssets.settingsIcon,
                width: 20.w,
                height: 20.h,
                boxFit: BoxFit.fill,
                color: Colors.black,
              ),
              mediumHorizontalSpace,
              Text('نسخة المقارنة',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      )),
            ],
          )),
    );
  }
}
