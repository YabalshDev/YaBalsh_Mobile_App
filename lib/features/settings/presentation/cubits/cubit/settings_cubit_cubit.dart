import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/services/app_settings_service.dart';

part 'settings_cubit_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AppSettingsService appSettingsService;
  SettingsCubit({required this.appSettingsService})
      : super(const IsNearStoresState(isNearStores: false));

  void getIsNearStoresSetting() async {
    final isNearSetting = await appSettingsService.getIsNearStoresSetting();

    emit(IsNearStoresState(isNearStores: isNearSetting));
  }

  void changeIsNearStoresSetting(bool value) {
    saveIsNearStoresSetting(value);
    emit(IsNearStoresState(isNearStores: value));
  }

  void handleIsNearSettingSwitchTap(bool value) {
    appSettingsService.setIsNearStores(value);
    changeIsNearStoresSetting(value);
    // if (value) {
    //   appSettingsService.setIsNearStores(false);
    //   changeIsNearStoresSetting(false);
    // } else {
    //   appSettingsService.setIsNearStores(true);
    //   changeIsNearStoresSetting(true);
    // }
  }

  void saveIsNearStoresSetting(bool setting) =>
      appSettingsService.saveIsNearStoresSettings(setting);
}
