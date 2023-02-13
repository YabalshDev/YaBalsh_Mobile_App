// ignore_for_file: unused_field, prefer_final_fields

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_all_brands_usecase.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_recipie_details_usecase.dart';

import '../../../domain/entities/recipie.dart';
import '../../../domain/usecases/get_all_recipies_usecase.dart';

part 'recipies_state.dart';

class RecipiesCubit extends Cubit<RecipiesState> {
  final GetAllBrandsUseCase getAllBrandsUseCase;
  final GetRecipieDetailsUseCase getRecipieDetailsUseCase;
  final GetAllRecpiesUseCase getRecipiesUseCase;

  RecipiesCubit(
      {required this.getRecipieDetailsUseCase,
      required this.getRecipiesUseCase,
      required this.getAllBrandsUseCase})
      : super(const RecipiesState());

  List<Brand> _brands = [];
  List<Recipie> _recipies = [];

  int _brandsCurrentPage = 1;
  int _recipiesCurrentPage = 1;

  void getBrands() async {
    final response =
        await getAllBrandsUseCase(GetAllBrandsParams(page: _brandsCurrentPage));

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          brandsRequestState: RequestState.error));
    }, (result) {
      if (result.isNotEmpty) {
        _brandsCurrentPage++;
      }
      _brands.addAll(result);
      emit(state.copyWith(
          brandsRequestState: RequestState.loaded,
          brands: _brands,
          brandsPaginationLoading: false));
    });
  }

  Future<List<Recipie>> getRecipies() async {
    List<Recipie> allRecipies = [];
    final response = await getRecipiesUseCase(
        GetAllBrandsParams(page: _recipiesCurrentPage));

    response.fold((failure) {
      emit(state.copyWith(
          recipiesRequestState: RequestState.error,
          recipiesErrorMessage: failure.message));

      return;
    }, (result) => allRecipies = result);

    return allRecipies;
  }

  void getAllRecipieDetails() async {
    List<Recipie> allRecipies = await getRecipies();
    bool hasError = false;

    if (allRecipies.isNotEmpty) {
      for (Recipie recipie in allRecipies) {
        final response = await getRecipieDetailsUseCase(
            GetRecipieDetailsParams(id: recipie.id!));

        response.fold((failure) {
          emit(state.copyWith(
              recipiesRequestState: RequestState.error,
              recipiesErrorMessage: failure.message));
          hasError = true;
          return;
        }, (result) {
          _recipies.add(result);
        });
      }

      if (!hasError) {
        _recipiesCurrentPage++;
      }
    }
    emit(state.copyWith(
        recipies: _recipies,
        recipiesRequestState: RequestState.loaded,
        recipiesPaginationLoading: false));
  }

  void handlePagination(String type) {
    if (type == 'brands') {
      emit(state.copyWith(
          brandsRequestState: RequestState.idle,
          brandsPaginationLoading: true));

      getBrands();
    } else {
      emit(state.copyWith(
          recipiesRequestState: RequestState.idle,
          recipiesPaginationLoading: true));

      getAllRecipieDetails();
    }
  }
}
