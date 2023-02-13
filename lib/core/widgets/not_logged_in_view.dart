import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';

import '../routes/app_routes.dart';

class NotLoggedInView extends StatelessWidget {
  const NotLoggedInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: SingleChildScrollView(
              child: ErrorIndicator(errorMessage: 'انت لست مسجلا...سجل دخول'))),
      bottomNavigationBar: Container(
        height: 71.h,
        padding: EdgeInsets.fromLTRB(17.w, 0, 17.w, 14.h),
        child: YaBalashCustomButton(
            onTap: () => Get.offNamed(RouteHelper.getPhoneNumberRoute(),
                arguments: Get.currentRoute),
            child: const Text('تسجيل دخول / مستخدم جديد')),
      ),
    );
  }
}
