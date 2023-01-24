// ignore_for_file: unused_field

import 'package:hive/hive.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';

import '../../features/zones/domain/entities/sub_zone.dart';

abstract class ZoneService {
  SubZone? _currentSubZone;
  SubZone? get currentSubZone;
  void getCurrentSubZone();
  void setCurrentSubZone(SubZone subZone);
}

class ZoneServiceImpl implements ZoneService {
  @override
  SubZone? _currentSubZone;
  @override
  SubZone? get currentSubZone => _currentSubZone;
  @override
  void getCurrentSubZone() {
    final box = Hive.box<SubZone>(AppStrings.zones);
    if (box.values.isNotEmpty) {
      _currentSubZone = box.values.toList().last;
    }
  }

  @override
  void setCurrentSubZone(SubZone subZone) {
    _currentSubZone = subZone;
  }
}
