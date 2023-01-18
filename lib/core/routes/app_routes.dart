import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/constants.dart';
import 'package:yabalash_mobile_app/core/utils/enums/search_navigation_screens.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';
import 'package:yabalash_mobile_app/core/widgets/keyboard_dissmisable.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/blocs/cubit/address_cubit.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/blocs/cubit/update_address_cubit.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/views/addresses_view.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/views/update_address_view.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/login_cubit.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/phone_number_cubit.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/register_cubit.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/views/login_view.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/views/phone_number_view.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/views/register_view.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/main_navigation_cubit.dart';
import 'package:yabalash_mobile_app/features/home/presentation/views/main_navigation_view.dart';
import 'package:yabalash_mobile_app/features/notifications/presentation/blocs/cubit/notifications_cubit.dart';
import 'package:yabalash_mobile_app/features/notifications/presentation/views/notifications_view.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/splash_cubit.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/views/on_boarding_view.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/views/splash_view.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/blocs/cubit/past_orders_cubit.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/views/order_success_view.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/views/past_orders_view.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/blocs/cubit/product_details_cubit.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/brands_cubit.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/recipie_details_cubit.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/recipies_cubit.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/views/brand_details_view.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/views/recipie_details_view.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/views/recipies_view.dart';
import 'package:yabalash_mobile_app/features/search/presentation/views/search_view.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/cubit/shopping_list_details_cubit.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/views/shopping_list_details_view.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/main_zone.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/blocs/cubit/main_zones_cubit.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/blocs/cubit/sub_zone_cubit.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/views/main_zones_view.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/views/sub_zones_view.dart';

import '../../features/home/domain/entities/product.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/orders/domain/entities/order.dart';
import '../../features/orders/presentation/blocs/cubit/order_success_cubit.dart';
import '../../features/reciepies/domain/entities/brand.dart';
import '../../features/search/presentation/blocs/cubit/search_cubit.dart';
import '../../features/shopping_lists/domain/entities/shopping_list.dart';
import '../depedencies.dart';

class RouteHelper {
  // paths

  static const String _intialRoute = '/';
  static const String _onBordingRoute = '/on-Boarding';
  static const String _homeRoute = '/home';
  static const String _mainNavigationRoute = '/main-navigation';
  static const String _productDetailsRoute = '/product-details';
  static const String _loginRoute = '/login';
  static const String _registerRoute = '/register';
  static const String _phoneNumberRoute = '/phone-number';
  static const String _mainZonesRoute = '/main-zones';
  static const String _subZonesRoutes = '/sub-zones';
  static const String _addressesRoute = '/addresses';
  static const String _updateAddressRoute = '/update-address';
  static const String _orderSuccessRoute = '/order-success';
  static const String _pastOrdersRoute = '/past-orders';
  static const String _shoppingListDetailsRoute = '/shopping-list-details';
  static const String _searchRoute = '/search';
  static const String _settingsRoute = '/settings';
  static const String _cartRoute = '/cart';
  static const String _recipiesRoute = '/recipies';
  static const String _recipieDetailsRoute = '/recipie-details';
  static const String _brandDetailsRoute = '/brand-details';
  static const String _notificationsRoute = '/notifcations';

  static getIntialRoute() => _intialRoute;
  static getOnBoardingRoute() => _onBordingRoute;
  static getHomeRoute() => _homeRoute;
  static getMainNavigationRoute() => _mainNavigationRoute;
  static getProductDetailsRoute() => _productDetailsRoute;
  static getLoginRoute() => _loginRoute;
  static getRegisterRoute() => _registerRoute;
  static getMainZonesRoute() => _mainZonesRoute;
  static getSubZonesRoute() => _subZonesRoutes;
  static getPhoneNumberRoute() => _phoneNumberRoute;
  static getAddressesRoute() => _addressesRoute;
  static getUpdateAddress() => _updateAddressRoute;
  static getOrderSuccessRoute() => _orderSuccessRoute;
  static getPastOrdersRoute() => _pastOrdersRoute;
  static getShoppingListDetailsRoute() => _shoppingListDetailsRoute;
  static getSearchRoute() => _searchRoute;
  static getCartRoute() => _cartRoute;
  static getSettingsRoute() => _settingsRoute;
  static getRecipiesRoute() => _recipiesRoute;
  static getRecipieDetailsRoute() => _recipieDetailsRoute;
  static getBrandDetailsRoute() => _brandDetailsRoute;
  static getNotificationsRoute() => _notificationsRoute;

  static final routes = [
    GetPage(
      name: _intialRoute,
      page: () => BlocProvider<SplashCubit>(
        create: (context) => getIt<SplashCubit>()..splashInit(),
        child: const SplashView(),
      ),
    ),
    GetPage(
      name: _onBordingRoute,
      page: () => BlocProvider<OnBoardingCubit>(
        create: (context) => getIt<OnBoardingCubit>(),
        child: const OnBoardingView(),
      ),
    ),
    GetPage(
        name: _mainNavigationRoute,
        page: () {
          int index = Get.arguments;
          return BlocProvider<MainNavigationCubit>(
            create: (context) =>
                getIt<MainNavigationCubit>()..setPageIndex(index),
            child: MainNavigation(pageIndex: index),
          );
        }),
    GetPage(
      name: _homeRoute,
      page: () => const HomeView(),
    ),
    GetPage(
        name: _productDetailsRoute,
        page: () {
          final Product product = Get.arguments;
          return CustomAnimatedWidget(
              child: BlocProvider<ProductDetailsCubit>(
            create: (context) => getIt<ProductDetailsCubit>()
              ..getProductDetails(productId: product.id!, withNearStores: true)
              ..getProductVariants(product: product)
              ..getSimmilarProducts(product: product),
            child: ProductDetailsView(
              product: product,
            ),
          ));
        }),
    GetPage(
        name: _loginRoute,
        page: () {
          return CustomAnimatedWidget(
              child: BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
            child: KeyboardDissmisable(
                child: LoginView(
              phoneNumber: Get.arguments[0],
              fromRoute: Get.arguments[1],
            )),
          ));
        }),
    GetPage(
        name: _registerRoute,
        page: () {
          return CustomAnimatedWidget(
              child: BlocProvider<RegisterCubit>(
            create: (context) => getIt<RegisterCubit>(),
            child: KeyboardDissmisable(
                child: RegisterView(
              phoneNumber: Get.arguments[0],
              fromRoute: Get.arguments[1],
            )),
          ));
        }),
    GetPage(
        name: _mainZonesRoute,
        page: () {
          return CustomAnimatedWidget(
            child: BlocProvider<MainZonesCubit>(
              create: (context) => getIt<MainZonesCubit>()
                ..getZonesHistory()
                ..getMainZones(),
              child: const MainZonesView(),
            ),
          );
        }),
    GetPage(
        name: _subZonesRoutes,
        page: () {
          final MainZone mainZone = Get.arguments;
          return CustomAnimatedWidget(
            child: BlocProvider<SubZoneCubit>(
              create: (context) =>
                  getIt<SubZoneCubit>()..getMainZoneSubZones(mainZone.id!),
              child: SubZonesView(mainZone: Get.arguments),
            ),
          );
        }),
    GetPage(
        name: _phoneNumberRoute,
        page: () {
          final String fromRoute = Get.arguments;
          return CustomAnimatedWidget(
              child: KeyboardDissmisable(
                  child: BlocProvider<PhoneNumberCubit>(
            create: (context) => getIt<PhoneNumberCubit>(),
            child: PhoneNumberView(fromRoute: fromRoute),
          )));
        }),
    GetPage(
        name: _addressesRoute,
        page: () {
          final String fromRoute = Get.arguments;
          return CustomAnimatedWidget(
              child: BlocProvider<AddressCubit>(
            create: (context) => getIt<AddressCubit>()..getAllAddress(),
            child: AddressesView(fromRoute: fromRoute),
          ));
        }),
    GetPage(
        name: _updateAddressRoute,
        page: () {
          return CustomAnimatedWidget(
              child: KeyboardDissmisable(
            child: BlocProvider<UpdateAddressCubit>(
              create: (context) => getIt<UpdateAddressCubit>(),
              child: UpdateAddress(
                isfromEdit: Get.arguments[0],
                address: Get.arguments[1],
                fromRoute: Get.arguments[2],
              ),
            ),
          ));
        }),
    GetPage(
        name: _orderSuccessRoute,
        transition: navigationTransition,
        transitionDuration: const Duration(milliseconds: 500),
        page: () {
          final Order order = Get.arguments[0];
          final bool isFromOrderDetails = Get.arguments[1];
          return CustomAnimatedWidget(
              child: BlocProvider<OrderSuccessCubit>(
                  create: (context) {
                    if (isFromOrderDetails) {
                      return getIt<OrderSuccessCubit>()..calculateSaving(order);
                    } else {
                      return getIt<OrderSuccessCubit>();
                    }
                  },
                  child: OrderSuccessView(
                    order: order,
                    isFromOrderDetails: isFromOrderDetails,
                  )));
        }),
    GetPage(
        name: _pastOrdersRoute,
        page: () {
          return CustomAnimatedWidget(
              child: BlocProvider<PastOrdersCubit>(
                  create: (context) =>
                      getIt<PastOrdersCubit>()..getPastOrders(),
                  child: const PastOrdersView()));
        }),
    GetPage(
        name: _shoppingListDetailsRoute,
        page: () {
          final ShoppingList shoppingList = Get.arguments[0];
          return CustomAnimatedWidget(
              child: BlocProvider<ShoppingListDetailsCubit>(
                  create: (context) => getIt<ShoppingListDetailsCubit>()
                    ..setShoppingListName(shoppingList.name!)
                    ..getShoppingListStores(
                        shoppingListItems: shoppingList.products!),
                  child: ShoppingListDetailsView(
                    shoppingList: shoppingList,
                  )));
        }),
    GetPage(
        name: _searchRoute,
        page: () {
          final String searchName = Get.arguments[1];
          final SearchNavigationScreens searchNavigationScreens =
              Get.arguments[0];
          return CustomAnimatedWidget(
            child: BlocProvider<SearchCubit>(
              create: (context) {
                switch (searchNavigationScreens) {
                  case SearchNavigationScreens.homeScreen:
                    return getIt<SearchCubit>()
                      ..getSearchHistory()
                      ..getMostSellingProducts();

                  case SearchNavigationScreens.categoriesScreen:
                    return getIt<SearchCubit>()
                      ..changeSearchIsEmpty(false)
                      ..getSearchHistory()
                      ..search(searchName)
                      ..getBestOffer();
                  case SearchNavigationScreens.nearStoresScreen:
                    return getIt<SearchCubit>()
                      ..changeSearchType(1)
                      ..changeSearchIsEmpty(false)
                      ..getSearchHistory()
                      ..getAllNearStores();
                  case SearchNavigationScreens.notificationsScreen:
                    return getIt<SearchCubit>()
                      ..changeSearchIsEmpty(false)
                      ..getSearchHistory()
                      ..search(searchName);
                }
              },
              child: KeyboardDissmisable(
                child: SearchView(
                    searchNavigationScreens: searchNavigationScreens,
                    intialValue: searchName),
              ),
            ),
          );
        }),
    GetPage(
        name: _recipiesRoute,
        page: () {
          final List<Recipie> recipies = Get.arguments;
          return CustomAnimatedWidget(
            child: BlocProvider<RecipiesCubit>(
              create: (context) => getIt<RecipiesCubit>()
                ..getBrands()
                ..getAllRecipieDetails(recipies),
              child: const RecipiesView(),
            ),
          );
        }),
    GetPage(
        name: _recipieDetailsRoute,
        page: () {
          final Recipie recipie = Get.arguments;
          return BlocProvider<RecipieDetailsCubit>(
            create: (context) =>
                getIt<RecipieDetailsCubit>()..getRecipieDetails(recipie.id!),
            child: const CustomAnimatedWidget(
              child: RecipieDetailsView(),
            ),
          );
        }),
    GetPage(
        name: _brandDetailsRoute,
        page: () {
          final Brand brand = Get.arguments;
          return BlocProvider<BrandsCubit>(
            create: (context) =>
                getIt<BrandsCubit>()..getBrandRecipies(brand.id!),
            child: CustomAnimatedWidget(
              child: BrandDetailsView(
                brand: brand,
              ),
            ),
          );
        }),
    GetPage(
        name: _notificationsRoute,
        page: () {
          return BlocProvider<NotificationsCubit>(
            create: (context) =>
                getIt<NotificationsCubit>()..getAllNotifications(),
            child: const CustomAnimatedWidget(child: NotificatiosView()),
          );
        }),
  ];
}
