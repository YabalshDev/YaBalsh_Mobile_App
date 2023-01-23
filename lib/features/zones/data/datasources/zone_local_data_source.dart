import 'package:hive/hive.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/core/services/zone_service.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

abstract class ZonesLocalDataSource {
  List<SubZone> getPastZones();
  void setZone({required SubZone subZone});
}

class ZoneLocalDataSourceImpl implements ZonesLocalDataSource {
  final LocalStorageProvider localStorageProvider;
  final ZoneService zoneService;

  ZoneLocalDataSourceImpl(
      {required this.zoneService, required this.localStorageProvider});
  @override
  List<SubZone> getPastZones() {
    try {
      if (!Hive.isBoxOpen(AppStrings.zones)) {
        Hive.openBox<SubZone>(AppStrings.zones);
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
      box.put(subZone.name, subZone);
      box.close();
      zoneService.setCurrentSubZone(subZone);
    } catch (err) {
      throw CacheException();
    }
  }
}
