import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_header.dart';
import '../../domain/entities/creator.dart';
import 'creator_details_section.dart';
import 'creator_recipies_section.dart';

class CreatorDetailsBody extends StatelessWidget {
  final Creator creator;
  const CreatorDetailsBody({super.key, required this.creator});

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
                title: 'وصفات ${creator.name}',
                iconPath: AppAssets.backIcon,
              ),
              largeVerticalSpace,
              CreatorDetailsSection(creator: creator),
              const CreatorRecipiesSection()
            ],
          ),
        ),
      ),
    );
  }
}
