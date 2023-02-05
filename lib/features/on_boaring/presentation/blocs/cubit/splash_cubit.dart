import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/services/user_service.dart';
import 'package:yabalash_mobile_app/core/services/zone_service.dart';
import 'package:yabalash_mobile_app/core/utils/notification_helper.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/register_device_usecase.dart';
import 'package:yabalash_mobile_app/features/on_boaring/domain/repositories/splash_repository.dart';

import '../../../../../core/cubits/cubit/connectivty_cubit.dart';
import '../../../../../core/services/device_service.dart';
import '../../../../../core/utils/save_device.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepository splashRepository;
  final ZoneService zoneService;
  final UserService userService;
  final Connectivity connectivity;
  final RegisterDeviceUseCase registerDeviceUseCase;

  SplashCubit(
      {required this.zoneService,
      required this.registerDeviceUseCase,
      required this.connectivity,
      required this.userService,
      required this.splashRepository})
      : super(SplashInitial());

  bool _isFirstTimeVisit = true;

  late StreamSubscription<ConnectivityResult> _connectivityController;

  void initConnectivityStream() {
    _connectivityController =
        connectivity.onConnectivityChanged.listen((event) {
      getIt<ConnectivtyCubit>().handleStatus(event);
    });
  }

  void checkDevice() async {
    getIt<DeviceService>().getDeviceFromLocalStorage();
    final currentDevice = getIt<DeviceService>().currentDevice;
    final token = getIt<UserService>().token;
    if (currentDevice == null && token.isEmpty) {
      saveDevice(sendToBackEnd: true);
    } else if (currentDevice == null && token.isNotEmpty) {
      final deviceId = await NotificationHelper.getDeviceId();
      if (deviceId.isNotEmpty) {
        final deviceRegistered = await getIt<DeviceService>()
            .registerDevice(deviceId: deviceId, token: token);

        if (deviceRegistered) {
          saveDevice(sendToBackEnd: false);
        }
      }
    }
  }

  void checkIfUserLoggedIn() async {
    userService.getToken();
  }

  void checkIfZoneExist() {
    zoneService.getCurrentSubZone();
  }

  void checkIsFirstTimeVisit() {
    final response = splashRepository.checkIsFirstTimeVisit();
    response.fold((failure) {}, (result) => _isFirstTimeVisit = result);
  }

  void setIsFirstTimeVisit(bool value) {
    final response = splashRepository.setIsFirstTimeVisit(value: value);

    response.fold((l) {}, (result) {});
  }

  void getCurrentCustomer() {
    getIt<UserService>().getCurrentCustomer();
  }

  void splashInit() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        initConnectivityStream();

        NotificationHelper.handleOnNotificationOpened();
        NotificationHelper.handleOnNotificationRecived();
        checkIsFirstTimeVisit();
        checkIfUserLoggedIn();
        getCurrentCustomer();
        checkIfZoneExist();

        if (_isFirstTimeVisit) {
          setIsFirstTimeVisit(false);
          saveDevice(sendToBackEnd: true);
          Get.offNamed(RouteHelper.getOnBoardingRoute());
        } else {
          checkDevice();

          Get.offNamed(RouteHelper.getMainNavigationRoute(), arguments: 0);
        }
      },
    );
  }
}
