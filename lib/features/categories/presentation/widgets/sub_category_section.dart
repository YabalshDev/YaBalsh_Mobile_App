import 'package:flutter/material.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../../domain/entities/category_section_data.dart';
import 'sub_category_list.dart';

class SubCategorySection extends StatelessWidget {
  final CategorySectionData categorySection;
  const SubCategorySection({
    Key? key,
    required this.categorySection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return categorySection.subCategories!.isEmpty
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeading(text: categorySection.mainCategoryName ?? ''),
              mediumVerticalSpace,
              SubCategoriesList(
                  subCategories: categorySection.subCategories ?? []),
              mediumVerticalSpace
            ],
          );
  }
}
