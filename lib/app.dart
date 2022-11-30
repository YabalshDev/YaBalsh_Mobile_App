import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/routes/app_routes.dart';

class YaBalashApp extends StatelessWidget {
  const YaBalashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        navigatorKey: Get.key,
        getPages: RouteHelper.routes,
        initialRoute: RouteHelper.getHomeRoute(),
        title: AppStrings.appName,
        theme: lightTheme,
      ),
    );
  }
}
