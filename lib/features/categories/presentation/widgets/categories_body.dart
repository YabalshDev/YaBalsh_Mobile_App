import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';

import '../../../../core/widgets/custom_header.dart';
import 'all_categories_sections.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: "الاقسام"),
            mediumVerticalSpace,
            const AllCategoriesSections(),
          ],
        ),
      ),
    );
  }
}
