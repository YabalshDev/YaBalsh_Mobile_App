import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/utils/app_bloc_observer.dart';

import 'app.dart';
import 'core/constants/app_strings.dart';
import 'features/zones/domain/entities/sub_zone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // intialize dependecies
  setupDependecies();
  await Hive.initFlutter();
  Hive.registerAdapter(SubZoneAdapter());
  await Hive.openBox(AppStrings.isFirstTimeVisitKey);
  await Hive.openBox(AppStrings.token);
  await Hive.openBox<SubZone>(AppStrings.zones);
  // intialize hive boxes
  Bloc.observer = AppBlocObserver();
  runApp(DevicePreview(builder: (context) => const YaBalashApp()));
}
