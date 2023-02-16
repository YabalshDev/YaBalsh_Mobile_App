import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/services/stores_service.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/utils/extensions/list_limit_extension.dart';
import 'package:yabalash_mobile_app/core/utils/get_unique_stores.dart';
import 'package:yabalash_mobile_app/core/utils/notification_helper.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/category.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/banner.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/home_section.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_banners_use_case.dart';

import 'package:yabalash_mobile_app/features/home/domain/usecases/get_near_stores_use_case.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_product_bybarcode_usecase.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_sections_use_case.dart';
import 'package:yabalash_mobile_app/features/zones/domain/usecases/get_past_subzones_usecase.dart';

import '../../../../../core/services/categories_service.dart';
import '../../../../zones/domain/entities/sub_zone.dart';
import '../../../domain/entities/store.dart';
import '../../../domain/usecases/get_maincategories_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMainCategoriesUseCase getMainCategoriesUseCase;
  final GetBannersUseCase getBannersUseCase;
  final GetNearStoresUseCase getNearStoresUseCase;
  final GetSectiosUseCase getSectiosUseCase;
  final GetPastSubZonesUseCase getPastSubZonesUseCase;
  final GetProductByBarCodeUseCase getProductByBarCodeUseCase;

  HomeCubit(
      {required this.getMainCategoriesUseCase,
      required this.getProductByBarCodeUseCase,
      required this.getPastSubZonesUseCase,
      required this.getBannersUseCase,
      required this.getNearStoresUseCase,
      required this.getSectiosUseCase})
      : super(const HomeState());

  void onBannerChanged(int index) {
    emit(state.copyWith(currentBannerIndex: index));
  }

  void getLastOffers() async {
    final response = await getMainCategoriesUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          lastOfferrequestState: RequestState.error,
          lastOffersError: failure.message));
    }, (offers) {
      getIt<CategoriesService>().setMainCategories(categories: offers);
      emit(state.copyWith(
          lastOfferrequestState: RequestState.loaded, lastOffers: offers));
    });
  }

  void getBanners() async {
    final response = await getBannersUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          bannersRequestState: RequestState.error,
          bannersError: failure.message));
    }, (banners) {
      emit(state.copyWith(
          bannersRequestState: RequestState.loaded, banners: banners));
    });
  }

  void getNearStores() async {
    final response = await getNearStoresUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          nearStoreRequestState: RequestState.error,
          nearStoresError: failure.message));
    }, (stores) {
      getIt<StoreService>().setNearStores(stores);

      List<Store> uniqueStores = getUniqueStores(stores);

      getIt<StoreService>().setUniqueStores(uniqueStores);

      emit(state.copyWith(
          nearStoreRequestState: RequestState.loaded,
          nearStores: uniqueStores));
    });
  }

  void getHomeSections() async {
    final response = await getSectiosUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          homeSectionsRequestState: RequestState.error,
          sectionsError: failure.message));
    }, (sections) {
      emit(state.copyWith(
          homeSectionsRequestState: RequestState.loaded,
          homeSections: sections));
    });
  }

  void requestNotificationsPermission() {
    NotificationHelper.handleNotificationsPermission();
  }

  void getProductByBarcode(String barcode) async {
    final response = await getProductByBarCodeUseCase(
        GetProductByBarcodeParams(barCode: barcode));

    response.fold((failure) {
      yaBalashCustomDialog(
          mainContent: failure.message,
          buttonTitle: 'حسنا',
          onConfirm: () => Get.back(),
          title: 'ملاحظة',
          isWithEmoji: false);
    }, (product) {
      Get.toNamed(RouteHelper.getProductDetailsRoute(), arguments: product);
    });
  }

  void scanBarCode() async {
    String result = '';

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'الغاء', true, ScanMode.BARCODE);

      if (result == '-1') {
        // in cancel
        Get.back();
      } else {
        String barCode = result.substring(1, 7);
        getProductByBarcode(barCode);

        // call comparing api

      }
    } on PlatformException {
      result = 'Failed to get platform version.';
      Get.back();
      yaBalashCustomDialog(
        isWithEmoji: false,
        buttonTitle: 'حسنا',
        mainContent: 'عذرا المنتج ليس متوفر الان...جرب لاحقا',
        onConfirm: () => Get.back(),
      );
    }
  }

  Future<List<SubZone>> getSubZoneHistory() async {
    List<SubZone> subZones = [];
    final response = await getPastSubZonesUseCase(NoParams());

    response.fold((l) {}, (result) {
      subZones = result;
    });

    return subZones.limit(3);
  }
}
