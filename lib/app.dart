import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/cubits/cubit/connectivty_cubit.dart';
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
            BlocProvider(
              create: (context) => getIt<CartCubit>()..fetchCartItems(),
            ),
            BlocProvider<ConnectivtyCubit>(
              create: (context) => getIt<ConnectivtyCubit>()
                ..getIntitalConnectionStatus()
                ..initConnectivityStream(),
            )
          ],
          child: BlocBuilder<ConnectivtyCubit, ConnectivtyState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return GetMaterialApp(
                useInheritedMediaQuery: true,
                textDirection: TextDirection.rtl,
                supportedLocales: const [Locale('ar'), Locale('en')],
                navigatorKey: Get.key,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  FormBuilderLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                getPages: RouteHelper.routes,
                initialRoute: RouteHelper.getIntialRoute(),
                title: AppStrings.appName,
                theme: lightTheme,
              );
            },
          ),
        ),
      ),
    );
  }
}
