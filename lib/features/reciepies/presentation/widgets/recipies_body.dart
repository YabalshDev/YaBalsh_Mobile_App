import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/all_recipies_section.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/creators_section.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/custom_header.dart';
import '../../domain/entities/recipie.dart';

class RecipiesBody extends StatelessWidget {
  final List<Recipie> recipies;
  const RecipiesBody({
    Key? key,
    required this.recipies,
  }) : super(key: key);

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
              title: 'قوائم الوصفات',
              iconPath: AppAssets.closeIcon,
              onIconTap: () => Get.offNamed(
                  RouteHelper.getMainNavigationRoute(),
                  arguments: 3),
            ),
            mediumVerticalSpace,
            const CreatorsSection(),
            smallVerticalSpace,
            AllRecipiesSection(
              recipies: recipies,
            )
          ],
        ),
      ),
    ));
  }
}
