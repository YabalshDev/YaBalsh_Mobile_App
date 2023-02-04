import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:yabalash_mobile_app/features/notifications/data/models/notification_additional_data.dart';

import '../constants/app_strings.dart';
import '../routes/app_routes.dart';
import 'enums/search_navigation_screens.dart';

class NotificationHelper {
  static void initNotificationsPlatform() async {
    await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared.setAppId(AppStrings.oneSignalAppId);

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    await OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true);
    await OneSignal.shared.getDeviceState();
  }

  static void handleOnNotificationRecived() {
    OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {
      print(event.notification.additionalData);
    });
  }

  static Future<String> getDeviceId() async {
    final status = await OneSignal.shared.getDeviceState();
    if (status != null && status.userId != null) {
      return status.userId!;
    } else {
      return '';
    }
  }

  static void handleNotificationsPermission() async {
    final status = await OneSignal.shared.getDeviceState();

    if (!status!.hasNotificationPermission) {
      await OneSignal.shared
          .promptUserForPushNotificationPermission(fallbackToSettings: true);
    }
  }

  static void handleOnNotificationOpened() {
    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      final notificationData = NotificationAdditionalData.fromJson(
          openedResult.notification.additionalData!);

      if (notificationData.isClickable!) {
        Get.toNamed(RouteHelper.getSearchRoute(), arguments: [
          SearchNavigationScreens.sections,
          notificationData.section != null
              ? notificationData.section!.name
              : '',
          notificationData.section!.id ?? 0
        ]);
      }
    });
  }
}
