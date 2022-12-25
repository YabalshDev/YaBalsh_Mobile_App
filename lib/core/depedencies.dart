import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/hive_local_storage_consumer.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/dio_consumer.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/interceptors.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/core/services/addresses_service.dart';
import 'package:yabalash_mobile_app/core/services/order_service.dart';
import 'package:yabalash_mobile_app/core/services/user_service.dart';
import 'package:yabalash_mobile_app/core/services/zone_service.dart';
import 'package:yabalash_mobile_app/features/addresses/data/datasources/address_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/addresses/data/repositories/address_repository_impl.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/repositories/address_repository.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/add_address_usecase.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/delete_address_usecase.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/edit_address_usecase.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/use%20cases/get_all_addresses_usecase.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/blocs/cubit/address_cubit.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/blocs/cubit/update_address_cubit.dart';
import 'package:yabalash_mobile_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:yabalash_mobile_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/login_cubit.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/phone_number_cubit.dart';
import 'package:yabalash_mobile_app/features/cart/data/datasources/cart_local_datasource.dart';
import 'package:yabalash_mobile_app/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:yabalash_mobile_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/add_cart_item_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/decrement_quantity_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/delete_cartItem.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/fetch_cart_items_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/get_store_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/increment_quantity.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/cart_cubit.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/order_summary_cubit.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/super_markets_cubit.dart';
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
import 'package:yabalash_mobile_app/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/orders/data/repositories/order_repository_impl.dart';
import 'package:yabalash_mobile_app/features/orders/domain/repositories/order_repository.dart';
import 'package:yabalash_mobile_app/features/orders/domain/usecases/create_order_usecase.dart';
import 'package:yabalash_mobile_app/features/orders/domain/usecases/get_past_orders_usecase.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/blocs/cubit/order_success_cubit.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/blocs/cubit/past_orders_cubit.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/data/datasources/shopping_list_local_datasource.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/data/repositories/shopping_list_repository_impl.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/repositories/shopping_list_repository.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/add_shopping_list_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/get_all_shopping_lists_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/rename_shopping_list_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/shopping_list_cubit.dart';
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

  getIt.registerLazySingleton(() => ZoneService());
  getIt.registerLazySingleton(() => OrderService());
  getIt.registerLazySingleton(() => AddressService());
  getIt.registerLazySingleton(() => UserService(localStorageProvider: getIt()));

  getIt.registerLazySingleton<HomeDataSource>(() => HomeMockDataSourceImpl());

  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(restApiProvider: getIt()));
  getIt.registerLazySingleton<AuthLocalDataSource>(() =>
      AuthLocalDataSourceImpl(
          localStorageProvider: getIt(), userService: getIt()));

  getIt.registerLazySingleton<ZonesRemoteDataSource>(
      () => ZonesRemoteDataSourceImpl(restApiProvider: getIt()));
  getIt.registerLazySingleton<ZonesLocalDataSource>(() =>
      ZoneLocalDataSourceImpl(
          localStorageProvider: getIt(), zoneService: getIt()));

  getIt.registerLazySingleton<AddressRemoteDatasource>(
      () => AddressRemoteDataSourceImpl(restApiProvider: getIt()));

  getIt.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(restApiProvider: getIt()));
  getIt.registerLazySingleton<CartLocalDataSource>(
      () => CartLocalDataSourceImpl());

  getIt.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(restApiProvider: getIt()));
  getIt.registerLazySingleton<ShoppingListLocalDataSource>(
      () => ShoppingListLocalDataSourceImpl());

  //repos
  getIt.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(localStorageProvider: getIt()));

  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: getIt()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: getIt(), authLocalDataSource: getIt()));

  getIt.registerLazySingleton<ZonesRepository>(() => ZonesRepositoryImpl(
      zonesLocalDataSource: getIt(), zonesRemoteDataSource: getIt()));

  getIt.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(addressRemoteDatasource: getIt()));

  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
      cartLocalDataSource: getIt(), cartRemoteDataSource: getIt()));

  getIt.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(
        orderRemoteDataSource: getIt(),
      ));
  getIt.registerLazySingleton<ShoppingListRepository>(
      () => ShoppingListRepositoryImpl(
            shoppingListLocalDataSource: getIt(),
          ));

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

  getIt.registerLazySingleton(
      () => GetAllAddressUseCase(addressRepository: getIt()));
  getIt.registerLazySingleton(
      () => AddAddressUseCase(addressRepository: getIt()));
  getIt.registerLazySingleton(
      () => EditAddressUseCase(addressRepository: getIt()));
  getIt.registerLazySingleton(
      () => DeleteAddressUseCase(addressRepository: getIt()));

  getIt.registerLazySingleton(
      () => FetchCartItemsUseCase(cartRepository: getIt()));
  getIt
      .registerLazySingleton(() => AddCartItemUseCase(cartRepository: getIt()));
  getIt.registerLazySingleton(
      () => IncrementQuantityUseCase(cartRepository: getIt()));
  getIt.registerLazySingleton(
      () => DeleteCartItemUseCase(cartRepository: getIt()));
  getIt.registerLazySingleton(
      () => DecrementQuantityUseCase(cartRepository: getIt()));
  getIt.registerLazySingleton(() => ClearCartUseCase(cartRepository: getIt()));
  getIt.registerLazySingleton(() => GetStoreUseCase(cartRepository: getIt()));

  getIt.registerLazySingleton(
      () => CreateOrderUseCase(orderRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetPastOrdersUseCase(orderRepository: getIt()));

  getIt.registerLazySingleton(
      () => GetAllShoppingListsUseCase(shoppingListRepository: getIt()));

  getIt.registerLazySingleton(
      () => RenameShoppingListUseCase(shoppingListRepository: getIt()));
  getIt.registerLazySingleton(
      () => AddShoppingListUseCase(shoppingListRepository: getIt()));

//cubits/blocs
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
  getIt.registerLazySingleton(
    () => OnBoardingCubit(),
  );
  getIt.registerLazySingleton(
    () => SplashCubit(
        splashRepository: getIt(), userService: getIt(), zoneService: getIt()),
  );
  getIt.registerLazySingleton(
    () => LoginCubit(loginUseCase: getIt(), authRepository: getIt()),
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

  getIt.registerFactory(
    () => AddressCubit(
        deleteAddressUseCase: getIt(), getAllAddressUseCase: getIt()),
  );

  getIt.registerFactory(() => UpdateAddressCubit(
        addAddressUseCase: getIt(),
        editAddressUseCase: getIt(),
      ));

  getIt.registerLazySingleton(() => CartCubit(
      fetchCartItemsUseCase: getIt(),
      addShoppingListUseCase: getIt(),
      incrementQuantityUseCase: getIt(),
      decrementQuantityUseCase: getIt(),
      addCartItemUseCase: getIt(),
      deleteCartItemUseCase: getIt(),
      clearCartUseCase: getIt()));

  getIt.registerFactory(() => SuperMarketsCubit(
        getStoreUseCase: getIt(),
      ));
  getIt.registerFactory(() => OrderSummaryCubit(
      getAllAddressUseCase: getIt(), createOrderUseCase: getIt()));
  getIt.registerFactory(() => OrderSuccessCubit());
  getIt.registerFactory(() => PastOrdersCubit(getPastOrdersUseCase: getIt()));
  getIt.registerFactory(() => ShoppingListCubit(
      getAllShoppingListsUseCase: getIt(), renameShoppingListUseCase: getIt()));
}
