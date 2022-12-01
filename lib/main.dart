import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/hive_store.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // intialize dependecies
  setupDependecies();
  // intialize hive boxes
  openHiveBoxes();
  runApp(DevicePreview(builder: (context) => const YaBalashApp()));
}
