import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_brand_recipies_usecase.dart';

import '../../../../../core/utils/enums/request_state.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../domain/usecases/get_recipie_details_usecase.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final GetBrandRecipiesUseCase getBrandRecipiesUseCase;
  final GetRecipieDetailsUseCase getRecipieDetailsUseCase;
  BrandsCubit(
      {required this.getRecipieDetailsUseCase,
      required this.getBrandRecipiesUseCase})
      : super(const BrandsState());

  void getBrandRecipies(int brandId) async {
    List<Recipie> recipies = [];
    final response =
        await getBrandRecipiesUseCase(GetBrandRecipiesParams(brandId: brandId));

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          recipiesRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    }, (result) => recipies = List.from(result));

    getAllRecipieDetails(recipies);
  }

  void getAllRecipieDetails(List<Recipie> recipies) async {
    if (recipies.isNotEmpty) {
      List<Recipie> allRecipies = [];
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
        }, (result) => allRecipies.add(result));
      }

      if (!hasError) {
        emit(state.copyWith(
            recipies: allRecipies, recipiesRequestState: RequestState.loaded));
      }
    } else {
      emit(state
          .copyWith(recipies: [], recipiesRequestState: RequestState.loaded));
    }
  }
}