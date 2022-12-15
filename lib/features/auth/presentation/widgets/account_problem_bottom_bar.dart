import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_dialog.dart';

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
              yaBalashCustomDialog(
                  buttonTitle: 'ابعتلنا رسالة',
                  subContent:
                      'احنا حابين نسمع منك أكتر ونساعدك ، ممكن تبعتلنا رسالة و فريق الدعم الفني هيتواصل معاك في أقرب وقت. ',
                  isWithEmoji: true,
                  onConfirm: () => Get.back(),
                  title: 'هل لديك مشكلة في الحساب؟',
                  mainContent: 'بنعتذر ليك جدا وبنشكرك علي تفهمك 💜');
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
