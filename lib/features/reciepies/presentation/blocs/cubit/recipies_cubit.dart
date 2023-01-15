import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_all_creators_usecase.dart';

import '../../../../../core/usecases/use_cases.dart';
import '../../../../../core/widgets/custom_dialog.dart';

part 'recipies_state.dart';

class RecipiesCubit extends Cubit<RecipiesState> {
  final GetAllBrandsUseCase getAllBrandsUseCase;
  RecipiesCubit({required this.getAllBrandsUseCase})
      : super(const RecipiesState());

  void getCreators() async {
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
}
