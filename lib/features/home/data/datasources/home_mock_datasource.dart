import 'package:yabalash_mobile_app/core/constants/constantdata/banner_mock_data.dart';

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
    final List<Section> sections = [];
    return sections;
  }

  @override
  Future<List<MainCategory>> getLatestOffers() async {
    final List<MainCategory> mainCategories = [];
    return mainCategories;
  }

  @override
  Future<List<Store>> getNearStores() async {
    final List<Store> stores = [];
    return stores;
  }
}
