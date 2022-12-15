import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/sub_category.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';

class SubCategoryCard extends StatelessWidget {
  final SubCategory subCategory;
  const SubCategoryCard({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCard(
          imagePath: subCategory.imagePath,
          backgroundColor: AppColorsLight.kSubCategoryCardColor,
        ),
        smallVerticalSpace,
        Text(
          subCategory.name ?? '',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.w700, color: Colors.black),
        )
      ],
    );
  }
}
