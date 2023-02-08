import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/search/domain/repositories/search_repository.dart';

import 'main_categories_products_search.dart';

class SubCategoriesProductsSearchUsecase
    implements UseCase<List<Product>, CategoriesProductsSearchParams> {
  final SearchRepository searchRepository;

  SubCategoriesProductsSearchUsecase({required this.searchRepository});
  @override
  Future<Either<Failure, List<Product>>> call(
          CategoriesProductsSearchParams params) =>
      searchRepository.subCategoriesProductsSearch(
          subCategoryId: params.id, page: params.page);
}
