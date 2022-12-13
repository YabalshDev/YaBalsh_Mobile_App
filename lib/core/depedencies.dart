import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
import 'package:yabalash_mobile_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/login_cubit.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/phone_number_cubit.dart';
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
import 'package:yabalash_mobile_app/features/zones/data/datasources/zone_remote_data_source.dart';
import 'package:yabalash_mobile_app/features/zones/data/repositories/zones_repository_impl.dart';
import 'package:yabalash_mobile_app/features/zones/domain/repositories/zones_repositoriy.dart';
import 'package:yabalash_mobile_app/features/zones/domain/usecases/get_all_subzones_usecase.dart';
import 'package:yabalash_mobile_app/features/zones/domain/usecases/get_past_subzones_usecase.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/blocs/cubit/main_zones_cubit.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/blocs/cubit/sub_zone_cubit.dart';

import '../features/auth/presentation/blocs/cubit/register_cubit.dart';
import '../features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';
import '../features/zones/data/datasources/zone_local_data_source.dart';

final getIt = GetIt.instance;
setupDependecies() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => AppInterceptor());
  getIt.registerLazySingleton(() => LogInterceptor());

  getIt.registerLazySingleton<RestApiProvider>(
      () => DioConsumer(client: getIt()));
  getIt.registerLazySingleton<LocalStorageProvider>(
      () => HiveLocalDataConsumer());
  getIt.registerLazySingleton<HomeDataSource>(() => HomeMockDataSourceImpl());

  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(restApiProvider: getIt()));
  getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(localStorageProvider: getIt()));

  getIt.registerLazySingleton<ZonesRemoteDataSource>(
      () => ZonesRemoteDataSourceImpl(restApiProvider: getIt()));
  getIt.registerLazySingleton<ZonesLocalDataSource>(
      () => ZoneLocalDataSourceImpl(localStorageProvider: getIt()));

  getIt.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(localStorageProvider: getIt()));

  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: getIt()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: getIt(), authLocalDataSource: getIt()));

  getIt.registerLazySingleton<ZonesRepository>(() => ZonesRepositoryImpl(
      zonesLocalDataSource: getIt(), zonesRemoteDataSource: getIt()));

  // use cases

  getIt.registerLazySingleton(
      () => GetLatestOffersUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(() => GetBannersUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetNearStoresUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(() => GetSectiosUseCase(homeRepository: getIt()));

  getIt.registerLazySingleton(() => RegisterUseCase(authRepository: getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(authRepository: getIt()));

  getIt.registerLazySingleton(
      () => GetSubZonesUseCase(zonesRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetPastSubZonesUseCase(zonesRepository: getIt()));

  getIt.registerFactory(
    () => HomeCubit(
        getLatestOffersUseCase: getIt(),
        getBannersUseCase: getIt(),
        getNearStoresUseCase: getIt(),
        getSectiosUseCase: getIt()),
  );

  getIt.registerFactory(
    () => MainNavigationCubit(),
  );
  getIt.registerFactory(
    () => OnBoardingCubit(),
  );
  getIt.registerFactory(
    () => SplashCubit(splashRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => LoginCubit(loginUseCase: getIt()),
  );
  getIt.registerLazySingleton(
    () => RegisterCubit(registerUseCase: getIt()),
  );
  getIt.registerFactory(
    () => MainZonesCubit(getPastSubZonesUseCase: getIt()),
  );
  getIt.registerFactory(
    () => SubZoneCubit(getSubZonesUseCase: getIt(), zonesRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => PhoneNumberCubit(),
  );
}
