import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/show_support_dialog.dart';

class AccountProblemBottomBar extends StatelessWidget {
  const AccountProblemBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            onPressed: () {
              showSupportDialog();
            },
            child: Text(
              'لديك مشكلة للدخول إلي حسابك؟',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: AppColorsLight.kAppPrimaryColorLight),
            ),
          ),
        ),
      ),
    );
  }
}
