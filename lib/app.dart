import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/cart_cubit.dart';

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
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CartCubit>(
              create: (context) => getIt<CartCubit>()..fetchCartItems(),
            )
          ],
          child: GetMaterialApp(
            key: UniqueKey(),
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
      ),
    );
  }
}
