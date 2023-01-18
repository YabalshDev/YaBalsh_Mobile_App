import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/sub_category.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/search_navigation_screens.dart';
import '../../../../core/widgets/custom_card.dart';

class SubCategoryCard extends StatelessWidget {
  final SubCategory subCategory;
  const SubCategoryCard({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteHelper.getSearchRoute(), arguments: [
        SearchNavigationScreens.categoriesScreen,
        subCategory.name
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCard(
            imagePath: subCategory.imagePath,
            backgroundColor: AppColorsLight.kSubCategoryCardColor,
            isAssetImage: false,
            withBorder: false,
          ),
          smallVerticalSpace,
          Container(
            constraints: BoxConstraints(maxWidth: 80.w),
            child: Text(
              subCategory.name ?? '',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
