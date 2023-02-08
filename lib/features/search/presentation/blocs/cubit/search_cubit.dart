// ignore_for_file: prefer_final_fields, unused_field

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/constants.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/utils/enums/search_navigation_screens.dart';
import 'package:yabalash_mobile_app/core/utils/extensions/list_limit_extension.dart';
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

  List<Product> _productsResult = [];
  List<StoreSearch> _storesResult = [];

  int _productsPageNumber = 1;
  int _storesPageNumber = 1;
  String _searchValue = '';

  SearchNavigationScreens _screen = SearchNavigationScreens.other;

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

  void _productSearch(String searchName) async {
    _handleResultsLoading();

    final response = await searchProductUsecase(
        SearchParams(searchName: searchName, page: _productsPageNumber));

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
      _productsPageNumber++;
      emit(state.copyWith(
          paginationLoading: false,
          chepeastProduct: const Product(),
          searchProductsRequestState: RequestState.loaded,
          searchProductsResult: _productsResult..addAll(result)));
    });
  }

  void _storeSearch(String searchName) async {
    _handleResultsLoading();
    final response = await searchStoreUsecase(
        SearchParams(searchName: searchName, page: _storesPageNumber));

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
      _storesPageNumber++;
      emit(state.copyWith(
          paginationLoading: false,
          searchStoresRequestState: RequestState.loaded,
          searchStoresResult: _storesResult..addAll(result)));
    });
  }

  void search(String searchName) async {
    _searchValue = searchName;
    _screen = SearchNavigationScreens.other;
    if (state.searchTypeIndex == 0) {
      // if in products section
      _productsPageNumber = 1;
      _productsResult = [];
      _productSearch(searchName);
    } else {
      // if in stores section
      _storesPageNumber = 1;
      _storesResult = [];
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
                cardImagePath: store.cardImagePath,
                logoImagePath: store.logoImagePath,
                id: store.id,
                location: e))
            .toList();
        allNearStores.addAll(stores);
      }
    }

    emit(state.copyWith(
        paginationLoading: false,
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
            mostSellingProducts: products.limit(5))));
  }

  void getSectionProducts(int sectionId) async {
    _handleResultsLoading();
    final response = await getSectionProductsUseCase(GetSectionProductsParams(
        sectionId: sectionId, page: _productsPageNumber));

    response.fold(
        (failure) => emit(
            state.copyWith(searchProductsRequestState: RequestState.error)),
        (products) {
      _productsPageNumber++;
      emit(state.copyWith(
          paginationLoading: false,
          searchProductsRequestState: RequestState.loaded,
          searchProductsResult: _productsResult..addAll(products)));
    });
  }

  void categoryProductsSearch(int id, bool isMainCategory) async {
    _handleResultsLoading();
    Either<Failure, List<Product>>? response;
    if (isMainCategory) {
      _screen = SearchNavigationScreens.mainCategories;
      response = await mainCategoriesProductsSearchUsecase(
          CategoriesProductsSearchParams(id: id, page: _productsPageNumber));
    } else {
      _screen = SearchNavigationScreens.subCategories;
      response = await subCategoriesProductsSearchUsecase(
          CategoriesProductsSearchParams(id: id, page: _productsPageNumber));
    }

    response.fold(
        (failure) => emit(
            state.copyWith(searchProductsRequestState: RequestState.error)),
        (products) {
      _productsPageNumber++;
      _productsResult = _productsResult..addAll(products);
      getBestOffer(_productsResult);
      emit(state.copyWith(
          paginationLoading: false,
          searchProductsRequestState: RequestState.loaded,
          searchProductsResult: _productsResult));
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

  void _handleResultsLoading() {
    if (_productsPageNumber > 1 || _storesPageNumber > 1) {
      emit(state.copyWith(
          paginationLoading: true,
          searchProductsRequestState: RequestState.idle));
    } else {
      if (state.searchTypeIndex == 0) {
        emit(state.copyWith(searchProductsRequestState: RequestState.loading));
      } else {
        emit(state.copyWith(searchStoresRequestState: RequestState.loading));
      }
    }
  }

  void handlePagination() {
    final String searchName =
        _searchValue.isNotEmpty ? _searchValue : Get.routing.args[1];
    final int id = Get.routing.args[2];

    switch (_screen) {
      case SearchNavigationScreens.homeScreen:
        break;
      case SearchNavigationScreens.other:
      case SearchNavigationScreens.storeScreen:
        if (state.searchTypeIndex == 0) {
          return _productSearch(searchName);
        } else {
          return _storeSearch(searchName);
        }
      case SearchNavigationScreens.nearStoresScreen:
        break;
      case SearchNavigationScreens.sections:
        if (state.searchTypeIndex == 0) {
          return getSectionProducts(id);
        } else {
          return;
        }
      case SearchNavigationScreens.mainCategories:
        if (state.searchTypeIndex == 0) {
          return categoryProductsSearch(id, true);
        } else {
          return;
        }
      case SearchNavigationScreens.subCategories:
        if (state.searchTypeIndex == 0) {
          return categoryProductsSearch(id, false);
        } else {
          return;
        }
    }
  }
}
