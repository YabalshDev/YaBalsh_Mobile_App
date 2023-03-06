import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/utils/app_bloc_observer.dart';
import 'package:yabalash_mobile_app/features/auth/domain/entities/customer.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/cart_item.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/device.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/price_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';

import 'app.dart';
import 'core/constants/app_strings.dart';
import 'features/zones/domain/entities/sub_zone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // intialize dependecies
  setupDependecies();
  // intialize hive local storage boxes
  await Hive.initFlutter();

  Hive.registerAdapter(SubZoneAdapter());
  Hive.registerAdapter(ShoppingListAdapter());
  Hive.registerAdapter(PriceModelAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(CustomerAdapter());
  Hive.registerAdapter(DeviceAdapter());
  await Hive.openBox(AppStrings.isFirstTimeVisitKey);
  await Hive.openBox(AppStrings.token);
  await Hive.openBox<SubZone>(AppStrings.zones);
  await Hive.openBox<CartItem>(AppStrings.cartKey);
  await Hive.openBox<ShoppingList>(AppStrings.shoppingListKey);
  await Hive.openBox<String>(AppStrings.searchHistoryKey);
  await Hive.openBox<Customer>(AppStrings.customerKey);
  await Hive.openBox<Device>(AppStrings.deviceKey);
  await Hive.openBox<bool>(AppStrings.isNearStoresActivatedKey);

  Bloc.observer = AppBlocObserver();
  // intialize notifications
  await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  await OneSignal.shared.setAppId(AppStrings.oneSignalAppId);

  await OneSignal.shared.getDeviceState();

  runApp(const YaBalashApp());
}
