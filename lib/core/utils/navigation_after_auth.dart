import 'package:get/get.dart';

import '../routes/app_routes.dart';

void handleSuccessfullAuthNavigation(String fromRoute) {
  if (fromRoute == RouteHelper.getCartRoute()) {
    Get.offAllNamed(RouteHelper.getMainNavigationRoute(), arguments: 2);
  } else if (fromRoute == RouteHelper.getSettingsRoute()) {
    Get.offAllNamed(RouteHelper.getMainNavigationRoute(), arguments: 4);
  } else if (fromRoute == RouteHelper.getAddressesRoute()) {
    Get.offAllNamed(RouteHelper.getAddressesRoute(),
        arguments: RouteHelper.getSettingsRoute());
  } else {
    Get.offAllNamed(RouteHelper.getMainNavigationRoute(), arguments: 0);
  }
}
