import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_recipie_details_usecase.dart';

import '../../../../../core/utils/enums/request_state.dart';

part 'recipie_details_state.dart';

class RecipieDetailsCubit extends Cubit<RecipieDetailsState> {
  final GetRecipieDetailsUseCase getRecipieDetailsUseCase;
  RecipieDetailsCubit({required this.getRecipieDetailsUseCase})
      : super(const RecipieDetailsState());

  void getRecipieDetails(int id) async {
    final response =
        await getRecipieDetailsUseCase(GetRecipieDetailsParams(id: id));

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          recipieRequestState: RequestState.error));
    },
        (result) => emit(state.copyWith(
            recipieRequestState: RequestState.loaded, recipie: result)));
  }
}
