import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/search/domain/entities/store_search.dart';
import 'package:yabalash_mobile_app/features/search/domain/repositories/search_repository.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/search_product_usecase.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/search_store_usecase.dart';

import '../../../../home/domain/entities/product.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;
  final SearchStoreUsecase searchStoreUsecase;
  final SearchProductUsecase searchProductUsecase;

  SearchCubit(
      {required this.searchRepository,
      required this.searchStoreUsecase,
      required this.searchProductUsecase})
      : super(const SearchState());

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
}
