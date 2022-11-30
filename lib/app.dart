import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/routes/app_routes.dart';

class YaBalashApp extends StatelessWidget {
  const YaBalashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      getPages: RouteHelper.routes,
      initialRoute: RouteHelper.getHomeRoute(),
      title: AppStrings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
