import 'package:yabalash_mobile_app/core/constants/constantdata/banner_mock_data.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/main_categories_list.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/sections_mock_list.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/stores_mock_list.dart';

import '../../domain/entities/banner.dart';
import '../../domain/entities/main_category.dart';
import '../../domain/entities/section.dart';
import '../../domain/entities/store.dart';

abstract class HomeMockDataSource {
  Future<List<MainCategory>> getLatestOffers();
  Future<List<Banner>> getBanners();
  Future<List<Store>> getNearStores();
  Future<List<Section>> getHomeSections({required String keword});
}

class HomeMockDataSourceImpl implements HomeMockDataSource {
  @override
  Future<List<Banner>> getBanners() async {
    List<Banner> banners = [];
    await Future.delayed(
      const Duration(seconds: 2),
      () => banners = bannersMockData,
    );

    return banners;
  }

  @override
  Future<List<Section>> getHomeSections({required String keword}) async {
    List<Section> sections = [];
    await Future.delayed(
      const Duration(seconds: 2),
      () => sections = sectionsMock,
    );
    return sections;
  }

  @override
  Future<List<MainCategory>> getLatestOffers() async {
    List<MainCategory> mainCategories = [];
    await Future.delayed(
      const Duration(seconds: 2),
      () => mainCategories = mainCategoriesMock,
    );
    return mainCategories;
  }

  @override
  Future<List<Store>> getNearStores() async {
    List<Store> stores = [];
    await Future.delayed(
      const Duration(seconds: 2),
      () => stores = storesMock,
    );
    return stores;
  }
}
