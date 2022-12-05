import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/sub_categories_mock.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/sub_category.dart';
import 'package:yabalash_mobile_app/features/categories/presentation/widgets/sub_category_card.dart';

import '../../../../core/widgets/custom_header.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHeader(isWithNotification: true, title: "الاقسام"),
          mediumVerticalSpace,
          Text(
            'مشروبات',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          mediumVerticalSpace,
          CategoriesSection(
              height: 220.h,
              subCategories: subCategories
                  .where((element) => element.mainCategory == "مشروبات")
                  .toList()),
          Text(
            'منتجات الالبان',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          mediumVerticalSpace,
          CategoriesSection(
            subCategories: subCategories
                .where((element) => element.mainCategory == "منتجات الالبان")
                .toList(),
            height: 220.h,
          )
        ],
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  final List<SubCategory> subCategories;
  final double height;
  const CategoriesSection(
      {super.key, required this.subCategories, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GridView.builder(
        itemCount: subCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 5.h,
            childAspectRatio: 0.6.w),
        itemBuilder: (context, index) {
          final subCategory = subCategories[index];
          return SubCategoryCard(subCategory: subCategory);
        },
      ),
    );
  }
}
