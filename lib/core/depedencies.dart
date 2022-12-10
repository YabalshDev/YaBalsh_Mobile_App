import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/hive_local_storage_consumer.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/dio_consumer.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/interceptors.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:yabalash_mobile_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/login_cubit.dart';
import 'package:yabalash_mobile_app/features/home/data/datasources/home_mock_datasource.dart';
import 'package:yabalash_mobile_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:yabalash_mobile_app/features/home/domain/repositories/home_repository.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_banners_use_case.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_latest_offers_use_case.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_near_stores_use_case.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_sections_use_case.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/home_cubit.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/main_navigation_cubit.dart';
import 'package:yabalash_mobile_app/features/on_boaring/data/repositories/splash_repository_impl.dart';
import 'package:yabalash_mobile_app/features/on_boaring/domain/repositories/splash_repository.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/splash_cubit.dart';

import '../features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';

setupDependecies() {
  Get.lazyPut(() => Dio());
  Get.lazyPut(() => AppInterceptor());
  Get.lazyPut(() => LogInterceptor());

  Get.lazyPut<RestApiProvider>(() => DioConsumer(client: Get.find()));
  Get.lazyPut<LocalStorageProvider>(() => HiveLocalDataConsumer());
  Get.lazyPut<HomeDataSource>(() => HomeMockDataSourceImpl());
  Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(restApiProvider: Get.find()));
  Get.lazyPut<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(localStorageProvider: Get.find()));

  Get.lazyPut<SplashRepository>(
      () => SplashRepositoryImpl(localStorageProvider: Get.find()));

  Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: Get.find()));
  Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: Get.find(), authLocalDataSource: Get.find()));

  // use cases

  Get.lazyPut(() => GetLatestOffersUseCase(homeRepository: Get.find()));
  Get.lazyPut(() => GetBannersUseCase(homeRepository: Get.find()));
  Get.lazyPut(() => GetNearStoresUseCase(homeRepository: Get.find()));
  Get.lazyPut(() => GetSectiosUseCase(homeRepository: Get.find()));

  Get.lazyPut(() => LoginUseCase(authRepository: Get.find()));

  Get.lazyPut(
    () => HomeCubit(
        getLatestOffersUseCase: Get.find(),
        getBannersUseCase: Get.find(),
        getNearStoresUseCase: Get.find(),
        getSectiosUseCase: Get.find()),
  );

  Get.lazyPut(
    () => MainNavigationCubit(),
  );
  Get.lazyPut(() => OnBoardingCubit(), fenix: true);
  Get.lazyPut(() => SplashCubit(splashRepository: Get.find()), fenix: true);
  Get.lazyPut(() => LoginCubit(loginUseCase: Get.find()), fenix: true);
}
