import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/search/data/models/product_search_response.dart';
import 'package:yabalash_mobile_app/features/search/data/models/store_search_response.dart';

abstract class SearchRemoteDataSource {
  Future<StoreSearchResponse> storeSearch({required String searchName});
  Future<ProductSearchResponse> productSearch({required String searchName});
  Future<ProductSearchResponse> mainCategoriesSearch(
      {required int mainCategoryId});
  Future<ProductSearchResponse> subCategoriesSearch(
      {required int subCategoryId});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final RestApiProvider restApiProvider;

  SearchRemoteDataSourceImpl({required this.restApiProvider});
  @override
  Future<ProductSearchResponse> productSearch(
      {required String searchName}) async {
    final resposne = await restApiProvider
        .get(productSearchEndpoint, queryParams: {'query': searchName});

    return ProductSearchResponse.fromJson(resposne);
  }

  @override
  Future<StoreSearchResponse> storeSearch({required String searchName}) async {
    final resposne = await restApiProvider
        .get(storesSearchEndpoint, queryParams: {'query': searchName});

    return StoreSearchResponse.fromJson(resposne);
  }

  @override
  Future<ProductSearchResponse> mainCategoriesSearch(
      {required int mainCategoryId}) async {
    final resposne = await restApiProvider
        .get(getMainCategoriesProductsEndpoint(mainCategoryId));

    return ProductSearchResponse.fromJson(resposne);
  }

  @override
  Future<ProductSearchResponse> subCategoriesSearch(
      {required int subCategoryId}) async {
    final resposne = await restApiProvider.get(
      getSubCategoryProductsEndpoint(subCategoryId),
    );

    return ProductSearchResponse.fromJson(resposne);
  }
}
