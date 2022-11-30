import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/views/splash_view.dart';

import '../features/home/presentatiom/views/home_view.dart';

class RouteHelper {
  // paths

  static const String _intialRoute = '/';
  static const String _onBordingRoute = '/on-Boarding';
  static const String _homeRoute = '/home';

  static getIntialRoute() => _intialRoute;
  static getOnBoardingRoute() => _onBordingRoute;
  static getHomeRoute() => _homeRoute;

  static final routes = [
    GetPage(
      name: _intialRoute,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _homeRoute,
      page: () => const HomeView(),
    )
  ];
}
