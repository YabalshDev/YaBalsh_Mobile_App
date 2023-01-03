// ignore_for_file: prefer_final_fields, unused_field

import 'package:yabalash_mobile_app/features/home/domain/entities/main_category.dart';

abstract class CategoriesService {
  List<MainCategory> _mainCategories = [];
  List<MainCategory> get mainCategories;
  void setMainCategories({required List<MainCategory> categories});
}

class CategoriesServiceImpl implements CategoriesService {
  @override
  List<MainCategory> _mainCategories = [];

  @override
  List<MainCategory> get mainCategories => _mainCategories;

  @override
  void setMainCategories({required List<MainCategory> categories}) =>
      _mainCategories = categories;
}
