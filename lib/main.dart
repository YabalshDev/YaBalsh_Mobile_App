import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/utils/app_bloc_observer.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/cart_item.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/price_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';

import 'app.dart';
import 'core/constants/app_strings.dart';
import 'features/zones/domain/entities/sub_zone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // intialize dependecies
  setupDependecies();
  await Hive.initFlutter();
  Hive.registerAdapter(SubZoneAdapter());
  Hive.registerAdapter(ShoppingListAdapter());
  Hive.registerAdapter(PriceModelAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox(AppStrings.isFirstTimeVisitKey);
  await Hive.openBox(AppStrings.token);
  await Hive.openBox<SubZone>(AppStrings.zones);
  await Hive.openBox<CartItem>(AppStrings.cartKey);
  await Hive.openBox<ShoppingList>(AppStrings.shoppingListKey);
  await Hive.openBox<String>(AppStrings.searchHistoryKey);
  // intialize hive boxes
  Bloc.observer = AppBlocObserver();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId(AppStrings.oneSignalAppId);

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);

  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const YaBalashApp()));
}
