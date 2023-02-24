// ignore_for_file: unused_field, prefer_final_fields

abstract class AppSettingsService {
  late String _appVersion;
  late bool _isNearStores;
  String get appVersion;
  bool get isNearStores;
  void setAppVersion(String appVersion);
  void setIsNearStores(bool value);
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
}
