import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class SettingsElementCard extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String title;
  final bool? isPhoto;

  const SettingsElementCard(
      {super.key,
      required this.onTap,
      this.isPhoto = false,
      required this.iconPath,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ListTile(
          onTap: onTap,
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 15.h,
          ),
          title: Row(
            children: [
              isPhoto!
                  ? Image.asset(
                      iconPath,
                      width: 15.w,
                      height: 16.h,
                      color: Colors.black,
                    )
                  : CustomSvgIcon(
                      iconPath: iconPath,
                      width: 15.w,
                      height: 16.h,
                    ),
              mediumHorizontalSpace,
              Text('طلباتي',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600)),
            ],
          )),
    );
  }
}
