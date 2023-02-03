import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_header.dart';
import '../../domain/entities/brand.dart';
import 'brand_details_section.dart';
import 'brand_recipies_section.dart';

class BrandDetailsBody extends StatelessWidget {
  final Brand brand;
  const BrandDetailsBody({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                title: 'وصفات ${brand.name}',
                iconPath: AppAssets.backIcon,
              ),
              largeVerticalSpace,
              CreatorDetailsSection(brand: brand),
              const CreatorRecipiesSection()
            ],
          ),
        ),
      ),
    );
  }
}
