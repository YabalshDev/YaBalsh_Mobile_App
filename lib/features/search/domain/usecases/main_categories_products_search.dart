import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/search/domain/repositories/search_repository.dart';

class MainCategoriesProductsSearchUsecase
    implements UseCase<List<Product>, CategoriesProductsSearchParams> {
  final SearchRepository searchRepository;

  MainCategoriesProductsSearchUsecase({required this.searchRepository});
  @override
  Future<Either<Failure, List<Product>>> call(
          CategoriesProductsSearchParams params) =>
      searchRepository.mainCategoriesProductsSearch(mainCategoryId: params.id);
}

class CategoriesProductsSearchParams extends Equatable {
  final int id;

  const CategoriesProductsSearchParams({required this.id});

  @override
  List<Object?> get props => [id];
}
