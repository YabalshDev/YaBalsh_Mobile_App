// ignore_for_file: unused_field

import 'package:hive/hive.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/device.dart';

abstract class DeviceService {
  Device? _currentDevice;
  Device? get currentDevice;

  void getDeviceFromLocalStorage();
  void saveDeviceToLocalStorage(Device device);
  void setCurrentDevice(Device device);
}

class DeviceServiceImpl implements DeviceService {
  @override
  Device? _currentDevice;

  @override
  Device? get currentDevice => _currentDevice;

  @override
  void getDeviceFromLocalStorage() async {
    try {
      if (!Hive.isBoxOpen(AppStrings.deviceKey)) {
        await Hive.openBox<Device>(AppStrings.deviceKey);
      }

      final box = Hive.box<Device>(AppStrings.deviceKey);
      _currentDevice = box.get('device');
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  void saveDeviceToLocalStorage(Device device) async {
    try {
      if (!Hive.isBoxOpen(AppStrings.deviceKey)) {
        await Hive.openBox<Device>(AppStrings.deviceKey);
      }

      final box = Hive.box<Device>(AppStrings.deviceKey);
      box.put('device', device);
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  void setCurrentDevice(Device device) {
    _currentDevice = device;
  }
}
