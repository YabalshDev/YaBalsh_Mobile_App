import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/features/search/domain/entities/store_search.dart';

import '../../../home/domain/entities/product.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<StoreSearch>>> storeSearch(
      {required String searchName, int? page});
  Future<Either<Failure, List<Product>>> productSearch(
      {required String searchName, int? page});
  Future<List<String>> getSearchHistory();
  Either<Failure, void> saveSearch({required String searchName});

  Future<Either<Failure, List<Product>>> mainCategoriesProductsSearch(
      {required int mainCategoryId, int? page});

  Future<Either<Failure, List<Product>>> subCategoriesProductsSearch(
      {required int subCategoryId, int? page});
}
