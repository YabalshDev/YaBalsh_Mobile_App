import 'package:hive/hive.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/core/services/zone_service.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

abstract class ZonesLocalDataSource {
  Future<List<SubZone>> getPastZones();
  void setZone({required SubZone subZone});
}

class ZoneLocalDataSourceImpl implements ZonesLocalDataSource {
  final LocalStorageProvider localStorageProvider;
  final ZoneService zoneService;

  ZoneLocalDataSourceImpl(
      {required this.zoneService, required this.localStorageProvider});
  @override
  Future<List<SubZone>> getPastZones() async {
    try {
      if (!Hive.isBoxOpen(AppStrings.zones)) {
        await Hive.openBox<SubZone>(AppStrings.zones);
      }
      final box = Hive.box<SubZone>(AppStrings.zones);
      return box.values.toList();
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  void setZone({required SubZone subZone}) async {
    try {
      if (!Hive.isBoxOpen(AppStrings.zones)) {
        await Hive.openBox<SubZone>(AppStrings.zones);
      }
      final box = Hive.box<SubZone>(AppStrings.zones);
      if (!box.values.toList().contains(subZone)) {
        box.add(subZone);
      } else {
        int index = box.values.toList().indexOf(subZone);
        box.deleteAt(index);
        box.add(subZone);
      }
      box.close();
      zoneService.setCurrentSubZone(subZone);
    } catch (err) {
      throw CacheException();
    }
  }
}
