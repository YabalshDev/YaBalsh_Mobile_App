import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';
import 'package:yabalash_mobile_app/core/widgets/keyboard_dissmisable.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/login_cubit.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/register_cubit.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/views/login_view.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/views/register_view.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/main_navigation_cubit.dart';
import 'package:yabalash_mobile_app/features/home/presentation/views/main_navigation_view.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/splash_cubit.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/views/on_boarding_view.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/views/splash_view.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/blocs/cubit/main_zones_cubit.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/views/main_zones_view.dart';

import '../../features/home/domain/entities/product.dart';
import '../../features/home/presentation/views/home_view.dart';

class RouteHelper {
  // paths

  static const String _intialRoute = '/';
  static const String _onBordingRoute = '/on-Boarding';
  static const String _homeRoute = '/home';
  static const String _mainNavigationRoute = '/main-navigation';
  static const String _productDetailsRoute = '/product-details';
  static const String _loginRoute = '/login';
  static const String _registerRoute = '/register';
  static const String _mainZonesRoute = '/main-zones';

  static getIntialRoute() => _intialRoute;
  static getOnBoardingRoute() => _onBordingRoute;
  static getHomeRoute() => _homeRoute;
  static getMainNavigationRoute() => _mainNavigationRoute;
  static getProductDetailsRoute() => _productDetailsRoute;
  static getLoginRoute() => _loginRoute;
  static getRegisterRoute() => _registerRoute;
  static getMainZonesRoute() => _mainZonesRoute;

  static final routes = [
    GetPage(
      name: _intialRoute,
      page: () => BlocProvider<SplashCubit>(
        create: (context) => Get.find<SplashCubit>()..splashInit(),
        child: const SplashView(),
      ),
    ),
    GetPage(
      name: _onBordingRoute,
      page: () => BlocProvider<OnBoardingCubit>(
        create: (context) => Get.find<OnBoardingCubit>(),
        child: const OnBoardingView(),
      ),
    ),
    GetPage(
      name: _mainNavigationRoute,
      page: () => BlocProvider<MainNavigationCubit>(
        create: (context) => Get.find<MainNavigationCubit>(),
        child: MainNavigation(),
      ),
    ),
    GetPage(
      name: _homeRoute,
      page: () => const HomeView(),
    ),
    GetPage(
        name: _productDetailsRoute,
        page: () {
          final Product product = Get.arguments;
          return CustomAnimatedWidget(
              child: ProductDetailsView(
            product: product,
          ));
        }),
    GetPage(
        name: _loginRoute,
        page: () {
          return CustomAnimatedWidget(
              child: BlocProvider<LoginCubit>(
            create: (context) => Get.find<LoginCubit>(),
            child: const KeyboardDissmisable(child: LoginView()),
          ));
        }),
    GetPage(
        name: _registerRoute,
        page: () {
          return CustomAnimatedWidget(
              child: BlocProvider<RegisterCubit>(
            create: (context) => Get.find<RegisterCubit>(),
            child: const KeyboardDissmisable(child: RegisterView()),
          ));
        }),
    GetPage(
        name: _mainZonesRoute,
        page: () {
          return CustomAnimatedWidget(
            child: BlocProvider<MainZonesCubit>(
              create: (context) =>
                  Get.find<MainZonesCubit>()..getZonesHistory(),
              child: const MainZonesView(),
            ),
          );
        })
  ];
}
