import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/hive_local_storage_consumer.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/dio_consumer.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/interceptors.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/core/cubits/cubit/connectivty_cubit.dart';
import 'package:yabalash_mobile_app/core/services/addresses_service.dart';
import 'package:yabalash_mobile_app/core/services/categories_service.dart';
import 'package:yabalash_mobile_app/core/services/order_service.dart';
import 'package:yabalash_mobile_app/core/services/stores_service.dart';
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
import 'package:yabalash_mobile_app/features/auth/domain/usecases/check_user_registered_usecase.dart';
import 'package:yabalash_mobile_app/features/auth/domain/usecases/get_current_customer_usecase.dart';
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
import 'package:yabalash_mobile_app/features/categories/data/datasources/categories_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:yabalash_mobile_app/features/categories/domain/repositories/categories_repository.dart';
import 'package:yabalash_mobile_app/features/categories/domain/usecases/get_sub_categories_usecase.dart';
import 'package:yabalash_mobile_app/features/categories/presentation/blocs/categories_cubit.dart';
import 'package:yabalash_mobile_app/features/home/data/datasources/home_mock_datasource.dart';
import 'package:yabalash_mobile_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:yabalash_mobile_app/features/home/domain/repositories/home_repository.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_banners_use_case.dart';

import 'package:yabalash_mobile_app/features/home/domain/usecases/get_maincategories_usecase.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_near_stores_use_case.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_section_products_usecase.dart';
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
import 'package:yabalash_mobile_app/features/product_details/data/datasources/product_details_remotedatasource.dart';
import 'package:yabalash_mobile_app/features/product_details/data/repositories/product_details_repository_impl.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/usecases/get_product_details_usecase.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/blocs/cubit/product_details_cubit.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/datasources/recipie_mock_data_source.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/datasources/recipie_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/repositories/recipies_repository_impl.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/repositories/recipies_repository.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_all_creators_usecase.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_all_recipies_usecase.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_brand_recipies_usecase.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_recipie_details_usecase.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/recipie_details_cubit.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/recipies_cubit.dart';
import 'package:yabalash_mobile_app/features/search/data/datasources/search_local_datasource.dart';
import 'package:yabalash_mobile_app/features/search/data/datasources/search_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/search/data/repositories/search_repository_impl.dart';
import 'package:yabalash_mobile_app/features/search/domain/repositories/search_repository.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/search_product_usecase.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/data/datasources/shopping_list_local_datasource.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/data/repositories/shopping_list_repository_impl.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/repositories/shopping_list_repository.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/add_shopping_list_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/get_all_shopping_lists_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/rename_shopping_list_usecase.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/cubit/shopping_list_details_cubit.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/shopping_list_cubit.dart';
import 'package:yabalash_mobile_app/features/zones/data/datasources/zone_remote_data_source.dart';
import 'package:yabalash_mobile_app/features/zones/data/repositories/zones_repository_impl.dart';
import 'package:yabalash_mobile_app/features/zones/domain/repositories/zones_repositoriy.dart';
import 'package:yabalash_mobile_app/features/zones/domain/usecases/get_all_mainzones_usecase.dart';
import 'package:yabalash_mobile_app/features/zones/domain/usecases/get_mainzone_subzones_usecase.dart';
import 'package:yabalash_mobile_app/features/zones/domain/usecases/get_past_subzones_usecase.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/blocs/cubit/main_zones_cubit.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/blocs/cubit/sub_zone_cubit.dart';

import '../features/auth/presentation/blocs/cubit/register_cubit.dart';
import '../features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';
import '../features/product_details/domain/repositories/product_details_repository.dart';
import '../features/reciepies/presentation/blocs/cubit/brands_cubit.dart';
import '../features/search/domain/usecases/search_store_usecase.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import '../features/zones/data/datasources/zone_local_data_source.dart';

final getIt = GetIt.instance;
setupDependecies() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton(() => AppInterceptor());
  getIt.registerLazySingleton(() => LogInterceptor());

  getIt.registerLazySingleton<RestApiProvider>(
      () => DioConsumer(client: getIt()));
  getIt.registerLazySingleton<LocalStorageProvider>(
      () => HiveLocalDataConsumer());
//services
  getIt.registerLazySingleton<ZoneService>(() => ZoneServiceImpl());
  getIt.registerLazySingleton<OrderService>(() => OrderServiceImpl());
  getIt.registerLazySingleton<AddressService>(() => AddressServiceImpl());
  getIt.registerLazySingleton<UserService>(
      () => UserServiceImpl(localStorageProvider: getIt()));
  getIt.registerLazySingleton<StoreService>(() => StoreServiceImpl());
  getIt.registerLazySingleton<CategoriesService>(() => CategoriesServiceImpl());

  getIt.registerLazySingleton<HomeDataSource>(
      () => HomeRemoteDataSourceImpl(restApiProvider: getIt()));

  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(restApiProvider: getIt()));
  getIt.registerLazySingleton<AuthLocalDataSource>(() =>
      AuthLocalDataSourceImpl(
          localStorageProvider: getIt(), userService: getIt()));

  getIt.registerLazySingleton<ZonesRemoteDataSource>(
      () => ZonesRemoteDataSourceImpl(restApiProvider: getIt()));
  getIt.registerLazySingleton<CategoriesDataSource>(
      () => CategoriesRemoteDataSourceImpl(restApiProvider: getIt()));
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

  getIt.registerLazySingleton<SearchLocalDataSource>(
      () => SearchLocalDataSourceImpl());
  getIt.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(restApiProvider: getIt()));
  getIt.registerLazySingleton<ProductDetailsRemoteDataSource>(
      () => ProductDetailsRemoteDataSourceImpl(restApiProvider: getIt()));

  getIt.registerLazySingleton<RecipieDataSource>(
      () => RecipieRemoteDatasource(restApiProvider: getIt()));

  //repos
  getIt.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(localStorageProvider: getIt()));

  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: getIt()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: getIt(), authLocalDataSource: getIt()));

  getIt.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(categoriesDataSource: getIt()));

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

  getIt.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(
        searchLocalDataSource: getIt(),
        searchRemoteDataSource: getIt(),
      ));

  getIt.registerLazySingleton<ProductDetailsRepository>(
      () => ProductDetailsRepositoryImpl(
            productDetailsRemoteDataSource: getIt(),
          ));

  getIt.registerLazySingleton<RecipiesRepository>(() => RecipiesRepositoryImpl(
        recipieDataSource: getIt(),
      ));
  // use cases

  getIt.registerLazySingleton(
      () => GetMainCategoriesUseCase(homeRepository: getIt()));

  getIt.registerLazySingleton(() => GetBannersUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetSectionProductsUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetNearStoresUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(() => GetSectiosUseCase(homeRepository: getIt()));

  getIt.registerLazySingleton(
      () => GetSubCategoriesUseCase(categoriesRepository: getIt()));

  getIt.registerLazySingleton(() => RegisterUseCase(authRepository: getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(authRepository: getIt()));
  getIt.registerLazySingleton(() => GetCurrentCustomerUseCase(
        authRepository: getIt(),
      ));
  getIt.registerLazySingleton(() => CheckUserRegisteredUseCase(
        authRepository: getIt(),
      ));

  getIt.registerLazySingleton(
      () => GetMainZoneSubZonesUseCase(zonesRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetMainZonesUseCase(zonesRepository: getIt()));
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

  getIt.registerLazySingleton(
      () => SearchProductUsecase(searchRepository: getIt()));
  getIt.registerLazySingleton(
      () => SearchStoreUsecase(searchRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetProductDetailsUseCase(productDetailsRepository: getIt()));

  getIt.registerLazySingleton(
      () => GetAllBrandsUseCase(recipiesRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetAllRecpiesUseCase(recipiesRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetRecipieDetailsUseCase(recipiesRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetBrandRecipiesUseCase(recipiesRepository: getIt()));

//cubits/blocs
  getIt.registerFactory(
    () => HomeCubit(
        getPastSubZonesUseCase: getIt(),
        getMainCategoriesUseCase: getIt(),
        getBannersUseCase: getIt(),
        getNearStoresUseCase: getIt(),
        getSectiosUseCase: getIt()),
  );

  getIt.registerFactory(
    () => MainNavigationCubit(),
  );

  getIt.registerFactory(
    () => CategoriesCubit(getSubCategoriesUseCase: getIt()),
  );
  getIt.registerLazySingleton(
    () => OnBoardingCubit(),
  );
  getIt.registerLazySingleton(
    () => ConnectivtyCubit(connectivity: getIt()),
  );
  getIt.registerLazySingleton(
    () => SplashCubit(
        splashRepository: getIt(),
        userService: getIt(),
        zoneService: getIt(),
        connectivity: getIt()),
  );
  getIt.registerFactory(
    () => LoginCubit(
        loginUseCase: getIt(),
        authRepository: getIt(),
        getCurrentCustomerUseCase: getIt()),
  );
  getIt.registerFactory(
    () => RegisterCubit(registerUseCase: getIt()),
  );
  getIt.registerFactory(
    () => MainZonesCubit(
        getPastSubZonesUseCase: getIt(), getMainZonesUseCase: getIt()),
  );
  getIt.registerFactory(
    () => SubZoneCubit(
        getMainZoneSubZonesUseCase: getIt(), zonesRepository: getIt()),
  );
  getIt.registerFactory(
    () => PhoneNumberCubit(checkUserRegisteredUseCase: getIt()),
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
  getIt.registerFactory(
      () => OrderSuccessCubit(getProductDetailsUseCase: getIt()));
  getIt.registerFactory(() => PastOrdersCubit(getPastOrdersUseCase: getIt()));
  getIt.registerFactory(() => ShoppingListCubit(
      getAllRecpiesUseCase: getIt(),
      getAllShoppingListsUseCase: getIt(),
      renameShoppingListUseCase: getIt()));

  getIt.registerFactory(
      () => ShoppingListDetailsCubit(renameShoppingListUseCase: getIt()));

  getIt.registerFactory(() => SearchCubit(
      getSectionProductsUseCase: getIt(),
      searchStoreUsecase: getIt(),
      searchProductUsecase: getIt(),
      searchRepository: getIt()));

  getIt.registerFactory(() => ProductDetailsCubit(
        getProductDetailsUseCase: getIt(),
        searchProductUsecase: getIt(),
      ));

  getIt.registerFactory(() => RecipiesCubit(
      getAllBrandsUseCase: getIt(), getRecipieDetailsUseCase: getIt()));
  getIt.registerFactory(() => BrandsCubit(
      getBrandRecipiesUseCase: getIt(), getRecipieDetailsUseCase: getIt()));
  getIt.registerFactory(() => RecipieDetailsCubit(
        getRecipieDetailsUseCase: getIt(),
      ));
}
