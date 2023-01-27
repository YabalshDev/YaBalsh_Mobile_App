import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/search/domain/entities/store_search.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/search_store_usecase.dart';

import '../../../../core/widgets/custom_dialog.dart';
import '../../../search/domain/usecases/search_product_usecase.dart';

part 'other_branches_state.dart';

class OtherBranchesCubit extends Cubit<OtherBranchesState> {
  final SearchStoreUsecase searchStoreUsecase;
  OtherBranchesCubit({required this.searchStoreUsecase})
      : super(const OtherBranchesState());

  void setCurrentStore(StoreSearch store) =>
      emit(state.copyWith(currentStore: store));

  void getOtherBranches(StoreSearch storeSearch) async {
    final response =
        await searchStoreUsecase(SearchParams(searchName: storeSearch.name!));

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          otherBranchesRequestState: RequestState.error));
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
          otherBranchesRequestState: RequestState.loaded,
          otherBranches: result));
    });
  }
}
