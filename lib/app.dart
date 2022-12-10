import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';

class YaBalashApp extends StatelessWidget {
  const YaBalashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: GetMaterialApp(
          textDirection: TextDirection.rtl,
          supportedLocales: const [Locale('ar'), Locale('en')],
          navigatorKey: Get.key,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            FormBuilderLocalizations.delegate,
          ],
          getPages: RouteHelper.routes,
          initialRoute: RouteHelper.getIntialRoute(),
          title: AppStrings.appName,
          theme: lightTheme,
        ),
      ),
    );
  }
}
