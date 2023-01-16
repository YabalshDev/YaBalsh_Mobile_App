import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/usecases/get_brand_recipies_usecase.dart';

import '../../../../../core/utils/enums/request_state.dart';
import '../../../../../core/widgets/custom_dialog.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final GetBrandRecipiesUseCase getBrandRecipiesUseCase;
  BrandsCubit({required this.getBrandRecipiesUseCase})
      : super(const BrandsState());

  void getBrandRecipies(int brandId) async {
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
    },
        (result) => emit(state.copyWith(
            recipiesRequestState: RequestState.loaded, recipies: result)));
  }
}
