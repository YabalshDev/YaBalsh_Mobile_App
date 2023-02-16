import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/category.dart';
import 'sub_category_card.dart';

class SubCategoriesList extends StatelessWidget {
  final List<Category> subCategories;

  const SubCategoriesList({
    super.key,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.horizontal,
        runSpacing: 15.h,
        spacing: 20.w,
        children: subCategories
            .map((subCategory) => SubCategoryCard(subCategory: subCategory))
            .toList());
  }
}
