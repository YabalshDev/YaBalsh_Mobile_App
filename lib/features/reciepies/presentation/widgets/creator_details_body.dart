import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_header.dart';
import 'creator_details_section.dart';
import 'creator_recipies_section.dart';

class CreatorDetailsBody extends StatelessWidget {
  const CreatorDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(
                isWithNotification: true,
                title: 'وصفات النوتيلا',
                iconPath: AppAssets.backIcon,
              ),
              largeVerticalSpace,
              const CreatorDetailsSection(),
              const CreatorRecipiesSection()
            ],
          ),
        ),
      ),
    );
  }
}
