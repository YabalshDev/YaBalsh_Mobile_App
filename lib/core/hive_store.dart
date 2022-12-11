import 'package:hive_flutter/hive_flutter.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

void openHiveBoxes() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SubZoneAdapter());
  await Hive.openBox(AppStrings.isFirstTimeVisitKey);
  await Hive.openBox(AppStrings.token);
  await Hive.openBox<SubZone>(AppStrings.zones);
}
