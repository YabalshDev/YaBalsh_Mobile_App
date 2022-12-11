import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/light/app_colors_light.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'عند قيامك بإنشاء حساب فأنك توافق ',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 9.sp)),
          TextSpan(
              text: 'الشروط والأحكام ',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp,
                  color: AppColorsLight.kAppPrimaryColorLight,
                  decoration: TextDecoration.underline)),
          TextSpan(
              text: 'و ',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 9.sp)),
          TextSpan(
              text: 'سياسة الخصوصية ',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp,
                  color: AppColorsLight.kAppPrimaryColorLight,
                  decoration: TextDecoration.underline)),
          TextSpan(
              text: 'الخاصة بنا',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 9.sp)),
        ]),
      ),
    );
  }
}
