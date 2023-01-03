import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/sub_category.dart';
import 'package:yabalash_mobile_app/features/categories/domain/repositories/categories_repository.dart';

class GetSubCategoriesUseCase
    implements UseCase<List<SubCategory>, GetSubCategoriesParams> {
  final CategoriesRepository categoriesRepository;

  GetSubCategoriesUseCase({required this.categoriesRepository});
  @override
  Future<Either<Failure, List<SubCategory>>> call(
          GetSubCategoriesParams params) =>
      categoriesRepository.getSubCategories(
          mainCategoryId: params.mainCategoryId);
}

class GetSubCategoriesParams extends Equatable {
  final int mainCategoryId;

  const GetSubCategoriesParams({required this.mainCategoryId});
  @override
  List<Object?> get props => [mainCategoryId];
}
