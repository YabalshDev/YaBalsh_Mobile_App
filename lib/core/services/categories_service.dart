// ignore_for_file: prefer_final_fields, unused_field

import 'package:yabalash_mobile_app/features/categories/domain/entities/category.dart';

abstract class CategoriesService {
  List<Category> _mainCategories = [];
  List<Category> get mainCategories;
  void setMainCategories({required List<Category> categories});
}

class CategoriesServiceImpl implements CategoriesService {
  @override
  List<Category> _mainCategories = [];

  @override
  List<Category> get mainCategories => _mainCategories;

  @override
  void setMainCategories({required List<Category> categories}) =>
      _mainCategories = categories;
}
