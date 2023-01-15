import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_header.dart';
import '../../domain/entities/brand.dart';
import 'creator_details_section.dart';
import 'creator_recipies_section.dart';

class CreatorDetailsBody extends StatelessWidget {
  final Brand brand;
  const CreatorDetailsBody({super.key, required this.brand});

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
                isWithNotification: true,
                title: 'وصفات ${brand.name}',
                iconPath: AppAssets.backIcon,
              ),
              largeVerticalSpace,
              CreatorDetailsSection(brand: brand),
              CreatorRecipiesSection(
                recipies: brand.recipies!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
