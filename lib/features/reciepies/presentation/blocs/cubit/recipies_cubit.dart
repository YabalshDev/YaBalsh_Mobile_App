import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/creator.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_all_creators_usecase.dart';

import '../../../../../core/usecases/use_cases.dart';
import '../../../../../core/widgets/custom_dialog.dart';

part 'recipies_state.dart';

class RecipiesCubit extends Cubit<RecipiesState> {
  final GetAllCreatorsUseCase getAllCreatorsUseCase;
  RecipiesCubit({required this.getAllCreatorsUseCase})
      : super(const RecipiesState());

  void getCreators() async {
    final response = await getAllCreatorsUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          creatorsRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    },
        (result) => emit(state.copyWith(
            creatorsRequestState: RequestState.loaded, creators: result)));
  }
}
