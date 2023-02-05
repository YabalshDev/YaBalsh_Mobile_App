import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

import '../widgets/custom_dialog.dart';

class MapUtils {
  MapUtils._();

  static void navigateToMap(double lat, double long, String title) async {
    final isAvailable = await MapLauncher.isMapAvailable(MapType.google);

    if (isAvailable!) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(lat, long),
        title: title,
        description: 'فرع',
      );
    } else {
      yaBalashCustomDialog(
          isWithEmoji: false,
          buttonTitle: 'حسنا',
          onConfirm: () => Get.back(),
          title: 'خطا ',
          mainContent: 'تعذر الوصول الى الخرائط');
    }
  }
}
