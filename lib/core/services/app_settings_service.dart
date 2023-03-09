// ignore_for_file: unused_field, prefer_final_fields, empty_catches

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants/app_strings.dart';
import 'app_config.dart';

abstract class AppSettingsService {
  late AppConfig _appConfig;
  late bool _isNearStores;
  late bool _showUpdateDialog;

  bool get isNearStores;
  bool get showUpdateDialog;
  AppConfig get appConfig;

  bool setShowUpdateDialog(bool value);
  void setUpRemoteConfig();
  void fetchAndSaveAppConfigs();

  void saveIsNearStoresSettings(bool value);
  Future<bool> getIsNearStoresSetting();
}

class AppSettingsServiceImpl implements AppSettingsService {
  final FirebaseRemoteConfig remoteConfig;

  AppSettingsServiceImpl({required this.remoteConfig});

  @override
  bool _isNearStores = false;

  @override
  bool get isNearStores => _isNearStores;

  @override
  Future<bool> getIsNearStoresSetting() async {
    try {
      bool? value;
      if (!Hive.isBoxOpen(AppStrings.isNearStoresActivatedKey)) {
        await Hive.openBox<bool>(AppStrings.isNearStoresActivatedKey);
      }

      final box = Hive.box<bool>(AppStrings.isNearStoresActivatedKey);
      value = box.get(AppStrings.isNearStoresActivatedKey);
      if (value != null) {
        _isNearStores = value;
        return value;
      } else {
        _isNearStores = false;
        return false;
      }
    } catch (err) {
      return _isNearStores;
    }
  }

  @override
  void saveIsNearStoresSettings(bool value) async {
    try {
      if (!Hive.isBoxOpen(AppStrings.isNearStoresActivatedKey)) {
        await Hive.openBox<bool>(AppStrings.isNearStoresActivatedKey);
      }

      final box = Hive.box<bool>(AppStrings.isNearStoresActivatedKey);
      box.put(AppStrings.isNearStoresActivatedKey,
          value); // change value in local storage
      _isNearStores = value; // change service settings for global use
    } catch (err) {
      debugPrint('failed to save setting');
    }
  }

  @override
  void fetchAndSaveAppConfigs() async {
    try {
      await remoteConfig.fetchAndActivate();
      final configs = remoteConfig.getAll();
      _appConfig = AppConfigFirebase.fromJson(configs);
    } catch (err) {
      _appConfig = AppConfig(
          appVersion: '1.0.0', updateDescription: AppStrings.defaultUpdateText);
    }
  }

  @override
  AppConfig _appConfig = AppConfig();

  @override
  AppConfig get appConfig => _appConfig;

  @override
  bool _showUpdateDialog = true;

  @override
  bool get showUpdateDialog => _showUpdateDialog;

  @override
  bool setShowUpdateDialog(bool value) => _showUpdateDialog = value;

  @override
  void setUpRemoteConfig() async {
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero));
    } catch (e) {}
  }
}
