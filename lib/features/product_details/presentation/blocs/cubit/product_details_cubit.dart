import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/services/app_settings_service.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/get_store_usecase.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/price_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/entites/product_relevant.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/usecases/get_product_details_usecase.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/usecases/get_product_relevants_usecase.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/search_product_usecase.dart';

import '../../../../../core/services/zone_service.dart';
import '../../../../home/domain/entities/product.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;
  final SearchProductUsecase searchProductUsecase;
  final GetProductRelevantsUseCase getProductRelevantsUseCase;
  final GetStoreUseCase getStoreUseCase;

  ProductDetailsCubit(
      {required this.getStoreUseCase,
      required this.getProductRelevantsUseCase,
      required this.getProductDetailsUseCase,
      required this.searchProductUsecase})
      : super(const ProductDetailsState());

  void changeWithNearStores(bool value) {
    emit(state.copyWith(withNearStores: value));
    emit(state.copyWith(productRequestState: RequestState.loading));
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(productRequestState: RequestState.loaded));
  }

  Future<List<Store>> _getProductStores(Product product) async {
    final List<PriceModel> productPrices = product.prices!.values.toList();
    List<Store> productStores = [];

    if (productPrices.isNotEmpty) {
      for (PriceModel productPrice in productPrices) {
        final response =
            await getStoreUseCase(GetStoreParams(id: productPrice.storeId!));

        response.fold((failure) {}, (store) => productStores.add(store));
      }
    }

    return productStores;
  }

  Map<String, List<Store>> _getProductBranches(List<Store> stores) {
    final subZone = getIt<ZoneService>().currentSubZone!;
    List<Store> nearStores = [];
    List<Store> farStores = [];

    for (var store in stores) {
      final otherZoneslocation =
          store.locations!.where((element) => element.subZoneId != subZone.id);
      final subZoneLocation =
          store.locations!.where((element) => element.subZoneId == subZone.id);

      if (otherZoneslocation.isNotEmpty) {
        farStores.add(store);
      }

      if (subZoneLocation.isNotEmpty) {
        nearStores.add(store);
      }
    }

    return {'nearStores': nearStores, 'farStores': farStores};
  }

  void changeProductNotified(bool value) =>
      emit(state.copyWith(isProductNotified: value));
  void changeShowMore(bool value) => emit(state.copyWith(showMore: value));
  void selectVariant(int index, Product product) {
    emit(state.copyWith(
        selectedVariantIndex: index,
        productRequestState: RequestState.loading));
    getProductDetails(productId: product.id!, withNearStores: true);
  }

  void getProductDetails(
      {required int productId, required withNearStores}) async {
    final response = await getProductDetailsUseCase(GetProductDetailsParams(
        productId: productId, withNearStores: withNearStores));

    response.fold((faiulre) {
      emit(state.copyWith(productRequestState: RequestState.error));
    }, (product) async {
      List<Store> stores = [];
      Map<String, List<Store>> branches = {};
      final isWithNearStoresActivated =
          getIt<AppSettingsService>().isNearStores;

      if (isWithNearStoresActivated) {
        // get filtered branches for product stores
        stores = await _getProductStores(product);
        branches = _getProductBranches(stores);
      } else {
        // get all stores without filtering
        stores = product.prices!.entries
            .map((price) => Store.fromPricesMap(price))
            .toList();
      }

      final relevants = await getProductRelevants(product.id!);
      emit(state.copyWith(
          productStores:
              isWithNearStoresActivated ? branches['farStores'] : stores,
          nearStores:
              isWithNearStoresActivated ? branches['nearStores'] : stores,
          productRelevants: relevants,
          product: product,
          productRequestState: RequestState.loaded));
    });
  }

  void getSimmilarProducts({required Product product}) async {
    final response = await searchProductUsecase(SearchParams(
        searchName:
            '${product.name!.split(' ')[0]} ${product.name!.split(' ')[1]}'));

    response.fold((failure) {
      emit(state.copyWith(popularProductsRequestState: RequestState.error));
      yaBalashCustomDialog(
          title: 'خطا',
          isWithEmoji: false,
          onConfirm: () => Get.back(),
          buttonTitle: 'حسنا',
          mainContent: "خطا اثناء جلب منتجات مشابهة");
    }, (products) {
      final simmilarProducts =
          products.where((element) => element.id != product.id).toList();
      emit(state.copyWith(
          popularProductsRequestState: RequestState.loaded,
          popularProducts: simmilarProducts));
    });
  }

  void getProductVariants({required Product product}) async {
    final searchName = product.name!.split('-')[0];
    final response =
        await searchProductUsecase(SearchParams(searchName: searchName));

    response.fold((failure) {
      emit(state.copyWith(productVariationRequestState: RequestState.error));
      yaBalashCustomDialog(
          title: 'خطا',
          isWithEmoji: false,
          onConfirm: () => Get.back(),
          buttonTitle: 'حسنا',
          mainContent: "خطا اثناء جلب انواع اخرى للمنتج");
    }, (products) {
      final variants =
          products.where((element) => element.id != product.id).toList();
      emit(state.copyWith(
          productVariationRequestState: RequestState.loaded,
          productVaraiations: variants));
    });
  }

  Future<List<String>> getProductRelevants(int productId) async {
    List<String> relevantNames = [];
    final response = await getProductRelevantsUseCase(
        GetProductRelevantsParams(productId: productId));

    response.fold((failure) {}, (relevants) {
      relevantNames = _getRelevantsNames(relevants);
    });

    return relevantNames;
  }

  List<String> _getRelevantsNames(ProductRelevant relevants) {
    List<String> relevantNames = [];

    if (relevants.subCategories!.isNotEmpty) {
      for (var subCategory in relevants.subCategories!) {
        relevantNames.add(subCategory.name!);
      }
    }

    if (relevants.sections!.isNotEmpty) {
      for (var section in relevants.sections!) {
        relevantNames.add(section.name!);
      }
    }
    return relevantNames;
  }
}
