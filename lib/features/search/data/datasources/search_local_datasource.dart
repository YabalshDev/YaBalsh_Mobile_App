import 'package:hive_flutter/hive_flutter.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';

abstract class SearchLocalDataSource {
  void saveSearch({required String searchName});
  Future<List<String>> getSearchHistory();
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  @override
  Future<List<String>> getSearchHistory() async {
    try {
      if (!Hive.isBoxOpen(AppStrings.searchHistoryKey)) {
        await Hive.openBox<String>(AppStrings.searchHistoryKey);
      }

      final box = Hive.box<String>(AppStrings.searchHistoryKey);
      return box.values.toList();
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  void saveSearch({required String searchName}) async {
    try {
      if (!Hive.isBoxOpen(AppStrings.searchHistoryKey)) {
        await Hive.openBox<String>(AppStrings.searchHistoryKey);
      }

      final box = Hive.box<String>(AppStrings.searchHistoryKey);
      box.put(searchName, searchName);
    } catch (err) {
      throw CacheException();
    }
  }
}
