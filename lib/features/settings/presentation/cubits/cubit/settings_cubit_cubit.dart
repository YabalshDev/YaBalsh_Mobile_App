import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/services/app_settings_service.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/depedencies.dart';
import '../../../../../core/widgets/custom_dialog.dart';

part 'settings_cubit_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AppSettingsService appSettingsService;
  SettingsCubit({required this.appSettingsService})
      : super(const IsNearStoresState(isNearStores: false));

  void getIsNearStoresSetting() async {
    final isNearSetting = await appSettingsService.getIsNearStoresSetting();

    emit(IsNearStoresState(isNearStores: isNearSetting));

    checkForUpdates();
  }

  void changeIsNearStoresSetting(bool value) {
    saveIsNearStoresSetting(value);
    emit(IsNearStoresState(isNearStores: value));
  }

  void handleIsNearSettingSwitchTap(bool value) {
    appSettingsService.setIsNearStores(value);
    changeIsNearStoresSetting(value);
  }

  void checkForUpdates() {
    final settingsService = getIt<AppSettingsService>();
    final appConfig = settingsService.appConfig;
    if (appConfig.appVersion != '1.0.0') {
      if (settingsService.showUpdateDialog) {
        yaBalashCustomDialog(
          title: 'تحديث جديد',
          mainContent: getIt<AppSettingsService>().appConfig.updateDescription,
          buttonTitle: 'حسنا',
          isWithEmoji: false,
          iconPath: AppAssets.updateIcon,
          onConfirm: () => Get.back(),
        );

        getIt<AppSettingsService>().setShowUpdateDialog(false);
      }
    }
  }

  void saveIsNearStoresSetting(bool setting) =>
      appSettingsService.saveIsNearStoresSettings(setting);
}
