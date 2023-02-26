// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants/app_strings.dart';

abstract class AppSettingsService {
  late String _appVersion;
  late bool _isNearStores;
  String get appVersion;
  bool get isNearStores;
  void setAppVersion(String appVersion);
  void setIsNearStores(bool value);
  void saveIsNearStoresSettings(bool value);
  Future<bool> getIsNearStoresSetting();
}

class AppSettingsServiceImpl implements AppSettingsService {
  @override
  String _appVersion = '1.0.0';
  @override
  String get appVersion => _appVersion;
  @override
  void setAppVersion(String version) {
    _appVersion = version;
  }

  @override
  bool _isNearStores = false;

  @override
  bool get isNearStores => _isNearStores;

  @override
  void setIsNearStores(bool value) {
    _isNearStores = value;
  }

  @override
  Future<bool> getIsNearStoresSetting() async {
    try {
      bool? value;
      if (Hive.isBoxOpen(AppStrings.isNearStoresActivatedKey)) {
        await Hive.openBox<bool>(AppStrings.isNearStoresActivatedKey);
      }

      final box = Hive.box<bool>(AppStrings.isNearStoresActivatedKey);
      value = box.get(AppStrings.isNearStoresActivatedKey);
      if (value != null) {
        _isNearStores = value;
        return value;
      } else {
        return false;
      }
    } catch (err) {
      return false;
    }
  }

  @override
  void saveIsNearStoresSettings(bool value) async {
    try {
      if (Hive.isBoxOpen(AppStrings.isNearStoresActivatedKey)) {
        await Hive.openBox<bool>(AppStrings.isNearStoresActivatedKey);
      }

      final box = Hive.box<bool>(AppStrings.isNearStoresActivatedKey);
      box.put(AppStrings.isNearStoresActivatedKey, value);
    } catch (err) {
      debugPrint('failed to save setting');
    }
  }
}
