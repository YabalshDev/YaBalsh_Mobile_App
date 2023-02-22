import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/services/zone_service.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/category.dart';
import 'package:yabalash_mobile_app/features/home/data/models/banners_response_model.dart';

import 'package:yabalash_mobile_app/features/home/data/models/near_stores_response_model.dart';
import 'package:yabalash_mobile_app/features/home/data/models/sections_response_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';

import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';

import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';

import 'package:yabalash_mobile_app/features/home/domain/entities/banner.dart';
import 'package:yabalash_mobile_app/features/product_details/data/models/product_response_model.dart';
import 'package:yabalash_mobile_app/features/search/data/models/product_search_response.dart';

import '../../../categories/data/models/category_response_model.dart';
import 'home_mock_datasource.dart';

class HomeRemoteDataSourceImpl implements HomeDataSource {
  final RestApiProvider restApiProvider;

  HomeRemoteDataSourceImpl({required this.restApiProvider});
  @override
  Future<List<Category>> getAllMainCategories() async {
    final response =
        await restApiProvider.get(mainCategoriesEndpoint.substring(1, 8));
    return CategoriesResponseModel.fromJson(response).data as List<Category>;
  }

  @override
  Future<List<Banner>> getBanners() async {
    final response = await restApiProvider.get(bannersEndpoint.substring(1, 8));
    return BannersResponseModel.fromJson(response).data as List<Banner>;
  }

  @override
  Future<List<Store>> getNearStores() async {
    final zoneId = getIt<ZoneService>().currentSubZone!.id;
    final response = await restApiProvider
        .get(nearStoresEndpoint.substring(1, 8), headers: {'zone': zoneId});
    return NearStoresResponseModel.fromJson(response).data as List<Store>;
  }

  @override
  Future<List<Product>> getSectionProducts(
      {required int sectionId, int? page}) async {
    final response = await restApiProvider.get(
        getSectionProductsEndpoint(sectionId).substring(1, 8),
        queryParams: page != null ? {'page': page} : null);
    return ProductSearchResponse.fromJson(response).data as List<Product>;
  }

  @override
  Future<List<Section>> getSections() async {
    final response =
        await restApiProvider.get(sectionsEndpoint.substring(1, 8));
    return SectionsResponseModel.fromJson(response).data as List<Section>;
  }

  @override
  Future<Product> getProductByBarcode({required String barCode}) async {
    final response =
        await restApiProvider.get(getProductEndPointByBarcode(barCode));
    return ProductResponseModel.fromJson(response).data as Product;
  }
}
