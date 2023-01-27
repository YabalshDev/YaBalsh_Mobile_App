import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/constants.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/location.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_section_products_usecase.dart';
import 'package:yabalash_mobile_app/features/search/domain/entities/store_search.dart';
import 'package:yabalash_mobile_app/features/search/domain/repositories/search_repository.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/main_categories_products_search.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/search_product_usecase.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/search_store_usecase.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/sub_categories_products_search.dart';

import '../../../../../core/depedencies.dart';
import '../../../../../core/services/stores_service.dart';
import '../../../../../core/services/zone_service.dart';
import '../../../../home/domain/entities/product.dart';
import '../../../../home/domain/entities/store.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;
  final SearchStoreUsecase searchStoreUsecase;
  final SearchProductUsecase searchProductUsecase;
  final GetSectionProductsUseCase getSectionProductsUseCase;
  final MainCategoriesProductsSearchUsecase mainCategoriesProductsSearchUsecase;
  final SubCategoriesProductsSearchUsecase subCategoriesProductsSearchUsecase;

  SearchCubit(
      {required this.searchRepository,
      required this.mainCategoriesProductsSearchUsecase,
      required this.subCategoriesProductsSearchUsecase,
      required this.getSectionProductsUseCase,
      required this.searchStoreUsecase,
      required this.searchProductUsecase})
      : super(const SearchState());

  void setIntialSearchValue(String value) =>
      emit(state.copyWith(intialValue: value));
  void changeProductSearchState(RequestState searchState) =>
      emit(state.copyWith(searchProductsRequestState: searchState));
  void changeStoreSearchState(RequestState searchState) =>
      emit(state.copyWith(searchStoresRequestState: searchState));

  void changeSearchIsEmpty(bool value) =>
      emit(state.copyWith(isSearchEmpty: value));

  void changeSearchType(int index) =>
      emit(state.copyWith(searchTypeIndex: index));

  void saveSearch(String searchName) {
    final response = searchRepository.saveSearch(searchName: searchName.trim());
    response.fold((failure) {
      debugPrint(failure.message);
    }, (r) => debugPrint('saved search name'));
  }

  void getSearchHistory() async {
    final searchHistory = await searchRepository.getSearchHistory();
    emit(state.copyWith(
        searchHistory: searchHistory.toSet().toList(),
        searchHistoryRequestState: RequestState.loaded));
  }

  void onSearchInit(String? searchName) async {
    // if idle or from home
    if (searchName != null) {
      final response =
          await searchProductUsecase(SearchParams(searchName: searchName));

      response.fold((failure) {
        emit(state.copyWith(errorMessage: failure.message));
        yaBalashCustomDialog(
          buttonTitle: 'حسنا',
          isWithEmoji: false,
          title: 'خطأ',
          mainContent: failure.message,
          onConfirm: () {
            Get.back();
          },
        );
      }, (result) {
        emit(state.copyWith(
            searchProductsRequestState: RequestState.loaded,
            searchProductsResult: result));
      });
    }
  }

  void _productSearch(String searchName) async {
    emit(state.copyWith(searchProductsRequestState: RequestState.loading));
    final response =
        await searchProductUsecase(SearchParams(searchName: searchName));

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          searchProductsRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () {
          Get.back();
        },
      );
    }, (result) {
      emit(state.copyWith(
          searchProductsRequestState: RequestState.loaded,
          searchProductsResult: result));
    });
  }

  void _storeSearch(String searchName) async {
    emit(state.copyWith(searchStoresRequestState: RequestState.loading));
    final response =
        await searchStoreUsecase(SearchParams(searchName: searchName));

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          searchStoresRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () {
          Get.back();
        },
      );
    }, (result) {
      emit(state.copyWith(
          searchStoresRequestState: RequestState.loaded,
          searchStoresResult: result));
    });
  }

  void search(String searchName) async {
    if (state.searchTypeIndex == 0) {
      // if in products section
      _productSearch(searchName);
    } else {
      // if in stores section
      _storeSearch(searchName);
    }
  }

  void getAllNearStores() {
    final nearStores = getIt<StoreService>().nearStores;
    final subZoneId = getIt<ZoneService>().currentSubZone!.id;
    List<StoreSearch> allNearStores = [];
    emit(state.copyWith(searchStoresRequestState: RequestState.loading));

    for (Store store in nearStores) {
      List<Location> branches = store.locations!
          .where((element) => element.subZoneId == subZoneId)
          .toList();

      if (branches.isNotEmpty) {
        List<StoreSearch> stores = branches
            .map((e) => StoreSearch(
                name: store.name,
                cardImagePath: store.logoImagePath,
                id: store.id,
                location: e))
            .toList();
        allNearStores.addAll(stores);
      }
    }

    // allNearStores = nearStores
    //     .map((e) => StoreSearch(
    //         cardImagePath: e.cardImagePath,
    //         id: e.id,
    //         location: e.locations!.last,
    //         name: e.name))
    //     .toList();
    emit(state.copyWith(
        searchStoresRequestState: RequestState.loaded,
        searchStoresResult: allNearStores));
  }

  void getMostSellingProducts() async {
    final response = await getSectionProductsUseCase(
        const GetSectionProductsParams(sectionId: mostSellingProductsId));

    response.fold(
        (failure) =>
            emit(state.copyWith(mostSellingRequestState: RequestState.error)),
        (products) => emit(state.copyWith(
            mostSellingRequestState: RequestState.loaded,
            mostSellingProducts: products)));
  }

  void getSectionProducts(int sectionId) async {
    emit(state.copyWith(searchProductsRequestState: RequestState.loading));
    final response = await getSectionProductsUseCase(
        GetSectionProductsParams(sectionId: sectionId));

    response.fold(
        (failure) => emit(
            state.copyWith(searchProductsRequestState: RequestState.error)),
        (products) => emit(state.copyWith(
            searchProductsRequestState: RequestState.loaded,
            searchProductsResult: products)));
  }

  void categoryProductsSearch(int id, bool isMainCategory) async {
    emit(state.copyWith(searchProductsRequestState: RequestState.loading));
    Either<Failure, List<Product>>? response;
    if (isMainCategory) {
      response = await mainCategoriesProductsSearchUsecase(
          CategoriesProductsSearchParams(id: id));
    } else {
      response = await subCategoriesProductsSearchUsecase(
          CategoriesProductsSearchParams(id: id));
    }

    response.fold(
        (failure) => emit(
            state.copyWith(searchProductsRequestState: RequestState.error)),
        (products) {
      getBestOffer(products);
      emit(state.copyWith(
          searchProductsRequestState: RequestState.loaded,
          searchProductsResult: products));
    });
  }

  void getBestOffer(List<Product> products) {
    if (products.isNotEmpty) {
      products.sort(((a, b) => a.prices!.entries.first.value.price!
          .compareTo(b.prices!.entries.first.value.price!)));
      // sort products

      emit(state.copyWith(
          chepeastProduct: products[0])); //first element is cheapest
    }
  }
}
