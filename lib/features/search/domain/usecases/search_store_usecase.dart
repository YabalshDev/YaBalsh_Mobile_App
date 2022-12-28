import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/search/domain/entities/store_search.dart';
import 'package:yabalash_mobile_app/features/search/domain/repositories/search_repository.dart';

import 'search_product_usecase.dart';

class SearchStoreUsecase implements UseCase<List<StoreSearch>, SearchParams> {
  final SearchRepository searchRepository;

  SearchStoreUsecase({required this.searchRepository});
  @override
  Future<Either<Failure, List<StoreSearch>>> call(SearchParams params) =>
      searchRepository.storeSearch(searchName: params.searchName);
}
