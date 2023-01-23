import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

import '../depedencies.dart';
import '../routes/app_routes.dart';
import '../services/zone_service.dart';

void handleOnZoneHistorySelection(SubZone subZone) {
  getIt<ZoneService>().setCurrentSubZone(subZone);
  Get.offAllNamed(RouteHelper.getMainNavigationRoute(), arguments: 0);
}
