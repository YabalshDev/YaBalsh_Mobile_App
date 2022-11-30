import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // intialize dependecies
  // intialize hive boxes
  runApp(DevicePreview(builder: (context) => const YaBalashApp()));
}
