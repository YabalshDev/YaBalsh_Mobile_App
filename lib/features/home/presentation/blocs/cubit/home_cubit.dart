import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/banner.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/main_category.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_banners_use_case.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_latest_offers_use_case.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_near_stores_use_case.dart';
import 'package:yabalash_mobile_app/features/home/domain/usecases/get_sections_use_case.dart';

import '../../../domain/entities/section.dart';
import '../../../domain/entities/store.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetLatestOffersUseCase getLatestOffersUseCase;
  final GetBannersUseCase getBannersUseCase;
  final GetNearStoresUseCase getNearStoresUseCase;
  final GetSectiosUseCase getSectiosUseCase;
  HomeCubit(
      {required this.getLatestOffersUseCase,
      required this.getBannersUseCase,
      required this.getNearStoresUseCase,
      required this.getSectiosUseCase})
      : super(const HomeState());

  void getLastOffers() async {
    final response = await getLatestOffersUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          lastOfferrequestState: RequestState.error,
          lastOffersError: failure.message));
    }, (offers) {
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
      emit(state.copyWith(
          bannersRequestState: RequestState.loaded, nearStores: stores));
    });
  }

  void getFirstSection() async {
    final response = await getSectiosUseCase(
        const GetSectiosParams(keword: 'ارخص الاسعار للمنتجات'));

    response.fold((failure) {
      emit(state.copyWith(
          firstSectionRequestState: RequestState.error,
          firstSectionError: failure.message));
    }, (sections) {
      emit(state.copyWith(
          firstSectionRequestState: RequestState.loaded,
          firstSection: sections[0]));
    });
  }
}
