import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/category_section_data.dart';
import 'package:yabalash_mobile_app/features/categories/domain/usecases/get_sub_categories_usecase.dart';

import '../../../../core/services/categories_service.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetSubCategoriesUseCase getSubCategoriesUseCase;
  CategoriesCubit({required this.getSubCategoriesUseCase})
      : super(const CategoriesState());

  // get categories sections

  void getCategoriesSections() async {
    List<CategorySectionData> categorySections = [];
    final mainCategories = getIt<CategoriesService>().mainCategories;

    for (var mainCategory in mainCategories) {
      final response = await getSubCategoriesUseCase(
          GetSubCategoriesParams(mainCategoryId: mainCategory.id!));

      response.fold((faiulre) {
        // show error message
        emit(state.copyWith(categoriesError: faiulre.message));
      },
          (subCategories) => categorySections.add(CategorySectionData(
              mainCategoryName: mainCategory.name,
              subCategories: subCategories)));
    }

    if (!isClosed) {
      emit(state.copyWith(
          categorySectionsRequestState: RequestState.loaded,
          categorySections: categorySections));
    }
  }
}
