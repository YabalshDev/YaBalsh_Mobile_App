import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

import '../../features/zones/domain/repositories/zones_repositoriy.dart';
import '../depedencies.dart';
import '../routes/app_routes.dart';

void handleOnZoneHistorySelection(SubZone subZone) {
  final zoneRepository = getIt<ZonesRepository>();
  zoneRepository.setZone(zone: subZone);
  Get.offAllNamed(RouteHelper.getMainNavigationRoute(), arguments: 0);
}
