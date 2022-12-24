import 'package:hive/hive.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';

import '../../features/zones/domain/entities/sub_zone.dart';

class ZoneService {
  SubZone? _currentSubZone;
  SubZone? get currentSubZone => _currentSubZone;
  void getCurrentSubZone() {
    // if (!Hive.isBoxOpen(AppStrings.zones)) {
    //   await Hive.openBox<SubZone>(AppStrings.zones);
    // }
    final box = Hive.box<SubZone>(AppStrings.zones);
    if (box.values.isNotEmpty) {
      _currentSubZone = box.values.toList().last;
    }
  }

  void setCurrentSubZone(SubZone subZone) {
    _currentSubZone = subZone;
  }
}
