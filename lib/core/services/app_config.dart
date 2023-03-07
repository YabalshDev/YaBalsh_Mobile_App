import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppConfig {
  final String? appVersion;
  final String? updateDescription;

  AppConfig({this.appVersion, this.updateDescription});
}

class AppConfigFirebase extends AppConfig {
  AppConfigFirebase({super.appVersion, super.updateDescription});

  factory AppConfigFirebase.fromJson(Map<String, dynamic> json) {
    return AppConfigFirebase(
        appVersion:
            (json['appVersion'] as RemoteConfigValue?)?.asString() ?? '',
        updateDescription:
            (json['updateDescription'] as RemoteConfigValue?)?.asString() ??
                '');
  }
}
