import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
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

  List<Store> _getNearStores(List<Store> stores) {
    final subZoneId = getIt<ZoneService>().currentSubZone!.id;
    List<Store> nearStores = [];

    for (var store in stores) {
      final subZonelocations = store.locations!
          .where((element) => element.subZoneId == subZoneId)
          .toList();
      if (subZonelocations.isNotEmpty) {
        for (var location in subZonelocations) {
          nearStores.add(store.copyWith(locations: [location]));
        }
      }
    }

    return nearStores;
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

    response.fold((l) {
      emit(state.copyWith(productRequestState: RequestState.error));
    }, (product) async {
      final stores = await _getProductStores(product);
      final relevants = await getProductRelevants(product.id!);
      final nearStores = _getNearStores(stores);
      emit(state.copyWith(
          productStores: stores,
          nearStores: nearStores,
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
