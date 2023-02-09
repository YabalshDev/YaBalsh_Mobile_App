import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/all_recipies_section.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/brands_section.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/custom_header.dart';

class RecipiesBody extends StatelessWidget {
  const RecipiesBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: kDefaultPadding,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(
                  title: 'قوائم الوصفات',
                  iconPath: AppAssets.closeIcon,
                  onIconTap: () => Get.offNamed(
                      RouteHelper.getMainNavigationRoute(),
                      arguments: 3),
                ),
                mediumVerticalSpace,
                const CreatorsSection(),
                smallVerticalSpace
              ],
            ),
          ),
          const SliverFillRemaining(
            child: AllRecipiesSection(),
          )
        ],
      ),
    ));
  }
}
