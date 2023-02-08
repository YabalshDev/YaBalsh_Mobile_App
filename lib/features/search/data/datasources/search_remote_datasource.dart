import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/search/data/models/product_search_response.dart';
import 'package:yabalash_mobile_app/features/search/data/models/store_search_response.dart';

abstract class SearchRemoteDataSource {
  Future<StoreSearchResponse> storeSearch(
      {required String searchName, int? page});
  Future<ProductSearchResponse> productSearch(
      {required String searchName, int? page});
  Future<ProductSearchResponse> mainCategoriesSearch(
      {required int mainCategoryId, int? page});
  Future<ProductSearchResponse> subCategoriesSearch(
      {required int subCategoryId, int? page});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final RestApiProvider restApiProvider;

  SearchRemoteDataSourceImpl({required this.restApiProvider});
  @override
  Future<ProductSearchResponse> productSearch(
      {required String searchName, int? page}) async {
    final resposne = await restApiProvider.get(productSearchEndpoint,
        queryParams: {'query': searchName, 'page': page ?? 1});

    return ProductSearchResponse.fromJson(resposne);
  }

  @override
  Future<StoreSearchResponse> storeSearch(
      {required String searchName, int? page}) async {
    final resposne = await restApiProvider.get(storesSearchEndpoint,
        queryParams: {'query': searchName, 'page': page ?? 1});

    return StoreSearchResponse.fromJson(resposne);
  }

  @override
  Future<ProductSearchResponse> mainCategoriesSearch(
      {required int mainCategoryId, int? page}) async {
    final resposne = await restApiProvider
        .get(getMainCategoriesProductsEndpoint(mainCategoryId));

    return ProductSearchResponse.fromJson(resposne);
  }

  @override
  Future<ProductSearchResponse> subCategoriesSearch(
      {required int subCategoryId, int? page}) async {
    final resposne = await restApiProvider.get(
        getSubCategoryProductsEndpoint(subCategoryId),
        queryParams: page != null ? {'page': page} : null);

    return ProductSearchResponse.fromJson(resposne);
  }
}
