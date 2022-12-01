import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/hive_local_storage_consumer.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/features/on_boaring/data/repositories/splash_repository_impl.dart';
import 'package:yabalash_mobile_app/features/on_boaring/domain/repositories/splash_repository.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/splash_cubit.dart';

import '../features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';

setupDependecies() {
  Get.lazyPut<LocalStorageProvider>(() => HiveLocalDataConsumer());
  Get.lazyPut<SplashRepository>(
      () => SplashRepositoryImpl(localStorageProvider: Get.find()));

  Get.lazyPut(() => OnBoardingCubit(), fenix: true);
  Get.lazyPut(() => SplashCubit(splashRepository: Get.find()), fenix: true);
}
