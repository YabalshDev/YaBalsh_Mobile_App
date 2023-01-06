import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/search/domain/repositories/search_repository.dart';

class SearchProductUsecase implements UseCase<List<Product>, SearchParams> {
  final SearchRepository searchRepository;

  SearchProductUsecase({required this.searchRepository});
  @override
  Future<Either<Failure, List<Product>>> call(SearchParams params) =>
      searchRepository.productSearch(searchName: params.searchName);
}

class SearchParams extends Equatable {
  final String searchName;

  const SearchParams({required this.searchName});

  @override
  List<Object?> get props => [searchName];
}
