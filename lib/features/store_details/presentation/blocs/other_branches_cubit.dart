// ignore_for_file: prefer_final_fields

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

  int _currentPage = 1;
  List<StoreSearch> _branches = [];

  void setCurrentStore(StoreSearch store) =>
      emit(state.copyWith(currentStore: store));

  void getOtherBranches(StoreSearch storeSearch) async {
    final response = await searchStoreUsecase(
        SearchParams(searchName: storeSearch.name!, page: _currentPage));

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
      if (result.isNotEmpty) {
        _currentPage++;
      }
      _branches.addAll(result);
      emit(state.copyWith(
          otherBranchesRequestState: RequestState.loaded,
          paginationLoading: false,
          otherBranches: _branches));
    });
  }

  void handleBranchesPagintation() {
    if (_branches.length > 14) {
      final StoreSearch store = Get.routing.args;

      emit(state.copyWith(
          paginationLoading: true,
          otherBranchesRequestState: RequestState.idle));
      getOtherBranches(store);
    }
  }
}
