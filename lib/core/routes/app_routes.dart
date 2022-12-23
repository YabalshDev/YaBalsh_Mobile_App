import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/splash_cubit.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/views/on_boarding_view.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/views/splash_view.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/blocs/cubit/past_orders_cubit.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/views/order_success_view.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/views/past_orders_view.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/blocs/cubit/main_zones_cubit.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/blocs/cubit/sub_zone_cubit.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/views/main_zones_view.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/views/sub_zones_view.dart';

import '../../features/home/domain/entities/product.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/orders/presentation/blocs/cubit/order_success_cubit.dart';
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
      page: () => BlocProvider<MainNavigationCubit>(
        create: (context) => getIt<MainNavigationCubit>(),
        child: MainNavigation(),
      ),
    ),
    GetPage(
      name: _homeRoute,
      page: () => const HomeView(),
    ),
    GetPage(
        name: _productDetailsRoute,
        page: () {
          final Product product = Get.arguments;
          return CustomAnimatedWidget(
              child: ProductDetailsView(
            product: product,
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
              phoneNumber: Get.arguments,
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
              phoneNumber: Get.arguments,
            )),
          ));
        }),
    GetPage(
        name: _mainZonesRoute,
        page: () {
          return CustomAnimatedWidget(
            child: BlocProvider<MainZonesCubit>(
              create: (context) => getIt<MainZonesCubit>()..getZonesHistory(),
              child: const MainZonesView(),
            ),
          );
        }),
    GetPage(
        name: _subZonesRoutes,
        page: () {
          return CustomAnimatedWidget(
            child: BlocProvider<SubZoneCubit>(
              create: (context) => getIt<SubZoneCubit>()..getSubZones(),
              child: SubZonesView(mainZone: Get.arguments),
            ),
          );
        }),
    GetPage(
        name: _phoneNumberRoute,
        page: () {
          return CustomAnimatedWidget(
              child: KeyboardDissmisable(
                  child: BlocProvider<PhoneNumberCubit>(
            create: (context) => getIt<PhoneNumberCubit>(),
            child: const PhoneNumberView(),
          )));
        }),
    GetPage(
        name: _addressesRoute,
        page: () {
          return CustomAnimatedWidget(
              child: BlocProvider<AddressCubit>(
            create: (context) => getIt<AddressCubit>()..getAllAddress(),
            child: const AddressesView(),
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
        page: () {
          return CustomAnimatedWidget(
              child: BlocProvider<OrderSuccessCubit>(
                  create: (context) => getIt<OrderSuccessCubit>(),
                  child: OrderSuccessView(
                    order: Get.arguments[0],
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
  ];
}
