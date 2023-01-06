import 'package:yabalash_mobile_app/core/api/remote_data_api/api_error_model.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/banner_mock_data.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/main_categories_list.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/products_mock_data.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/sections_mock_list.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/stores_mock_list.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';

import '../../domain/entities/banner.dart';
import '../../domain/entities/main_category.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/section.dart';
import '../../domain/entities/store.dart';

abstract class HomeDataSource {
  Future<List<MainCategory>> getLatestOffers();
  Future<List<Banner>> getBanners();
  Future<List<Store>> getNearStores();
  Future<List<Product>> getSectionProducts({required int sectionId});
  Future<List<Section>> getSections();
  Future<List<MainCategory>> getAllMainCategories();
}

class HomeMockDataSourceImpl implements HomeDataSource {
  @override
  Future<List<Banner>> getBanners() async {
    try {
      List<Banner> banners = [];
      await Future.delayed(
        const Duration(seconds: 2),
        () => banners = bannersMockData,
      );

      return banners;
    } catch (err) {
      throw const ServerException(errorModel: ApiErrorModel());
    }
  }

  @override
  Future<List<Section>> getSections() async {
    try {
      List<Section> sections = [];
      await Future.delayed(
        const Duration(seconds: 2),
        () => sections = sectionsMock,
      );
      return sections;
    } catch (err) {
      throw const ServerException(errorModel: ApiErrorModel());
    }
  }

  @override
  Future<List<MainCategory>> getLatestOffers() async {
    try {
      List<MainCategory> mainCategories = [];
      await Future.delayed(
        const Duration(seconds: 2),
        () => mainCategories = mainCategoriesMock,
      );
      return mainCategories;
    } catch (err) {
      throw const ServerException(errorModel: ApiErrorModel());
    }
  }

  @override
  Future<List<Store>> getNearStores() async {
    try {
      List<Store> stores = [];
      await Future.delayed(
        const Duration(seconds: 2),
        () => stores = storesMock,
      );
      return stores;
    } catch (err) {
      throw const ServerException(errorModel: ApiErrorModel());
    }
  }

  @override
  Future<List<Product>> getSectionProducts({required int sectionId}) async {
    try {
      List<Product> products = [];
      await Future.delayed(
        const Duration(seconds: 2),
        () => products = productsMock,
      );
      return products;
    } catch (err) {
      throw const ServerException(errorModel: ApiErrorModel());
    }
  }

  @override
  Future<List<MainCategory>> getAllMainCategories() async {
    try {
      List<MainCategory> categories = [];
      await Future.delayed(
        const Duration(seconds: 2),
        () => categories = mainCategoriesMock,
      );
      return categories;
    } catch (err) {
      throw const ServerException(errorModel: ApiErrorModel());
    }
  }
}
