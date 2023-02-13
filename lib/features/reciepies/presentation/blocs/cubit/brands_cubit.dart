// ignore_for_file: unused_field, prefer_final_fields

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_brand_recipies_usecase.dart';

import '../../../../../core/utils/enums/request_state.dart';
import '../../../domain/usecases/get_recipie_details_usecase.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final GetBrandRecipiesUseCase getBrandRecipiesUseCase;
  final GetRecipieDetailsUseCase getRecipieDetailsUseCase;
  BrandsCubit(
      {required this.getRecipieDetailsUseCase,
      required this.getBrandRecipiesUseCase})
      : super(const BrandsState());

  Brand _brand = Get.routing.args;
  List<Recipie> _recipies = [];
  int _currentPage = 1;
  void getBrandRecipies(int brandId) async {
    List<Recipie> recipies = [];
    final response = await getBrandRecipiesUseCase(
        GetBrandRecipiesParams(brandId: brandId, page: _currentPage));

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          recipiesRequestState: RequestState.error));
    }, (result) => recipies = List.from(result));

    getAllRecipieDetails(recipies);
  }

  void getAllRecipieDetails(List<Recipie> recipies) async {
    if (recipies.isNotEmpty) {
      bool hasError = false;

      for (Recipie recipie in recipies) {
        final response = await getRecipieDetailsUseCase(
            GetRecipieDetailsParams(id: recipie.id!));

        response.fold((failure) {
          emit(state.copyWith(
              recipiesRequestState: RequestState.error,
              errorMessage: failure.message));
          hasError = true;
          return;
        }, (result) => _recipies.add(result));
      }

      if (!hasError) {
        _currentPage++;
      }
    }

    emit(state.copyWith(
        recipies: _recipies,
        recipiesRequestState: RequestState.loaded,
        paginationLoading: false));
  }

  void handleRecipiesPagination() {
    emit(state.copyWith(
        recipiesRequestState: RequestState.idle, paginationLoading: true));
    getBrandRecipies(_brand.id!);
  }
}
