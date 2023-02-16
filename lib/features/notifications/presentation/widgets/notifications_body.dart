import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_header.dart';

import 'notifications_list_section.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

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
                  const CustomHeader(
                    iconPath: AppAssets.backIcon,
                    title: 'الاشعارات',
                  ),
                  mediumVerticalSpace,
                  largeHorizontalSpace
                ],
              ),
            ),
            const SliverFillRemaining(child: NotificationsListSection())
          ],
        ),
      ),
    );
  }
}
