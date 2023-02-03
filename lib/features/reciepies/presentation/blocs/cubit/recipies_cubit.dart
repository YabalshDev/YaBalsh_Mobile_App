import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_all_creators_usecase.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_recipie_details_usecase.dart';

import '../../../../../core/usecases/use_cases.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../domain/entities/recipie.dart';

part 'recipies_state.dart';

class RecipiesCubit extends Cubit<RecipiesState> {
  final GetAllBrandsUseCase getAllBrandsUseCase;
  final GetRecipieDetailsUseCase getRecipieDetailsUseCase;

  RecipiesCubit(
      {required this.getRecipieDetailsUseCase,
      required this.getAllBrandsUseCase})
      : super(const RecipiesState());

  void getBrands() async {
    final response = await getAllBrandsUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          brandsRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    },
        (result) => emit(state.copyWith(
            brandsRequestState: RequestState.loaded, brands: result)));
  }

  void getAllRecipieDetails(List<Recipie> recipies) async {
    List<Recipie> allRecipies = [];
    bool hasError = false;

    for (Recipie recipie in recipies) {
      final response = await getRecipieDetailsUseCase(
          GetRecipieDetailsParams(id: recipie.id!));

      response.fold((failure) {
        emit(state.copyWith(
            recipiesRequestState: RequestState.error,
            recipiesErrorMessage: failure.message));
        hasError = true;
        return;
      }, (result) => allRecipies.add(result));
    }

    if (!hasError) {
      emit(state.copyWith(
          recipies: allRecipies, recipiesRequestState: RequestState.loaded));
    }
  }
}
