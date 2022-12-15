import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/features/settings/presentation/widgets/settings_element_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_header.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(isWithNotification: false, title: 'الاعدادات'),
              largeVerticalSpace,
              Text(
                'حسابي',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              largeVerticalSpace,
              SettingsElementCard(
                  onTap: () {},
                  iconPath: AppAssets.ordersIcon,
                  title: 'طلباتي'),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              SettingsElementCard(
                  onTap: () {},
                  iconPath: AppAssets.addressesIcon,
                  title: 'عناويني'),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              SettingsElementCard(
                  onTap: () {},
                  iconPath: AppAssets.ordersIcon,
                  title: 'طلباتي'),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              SettingsElementCard(
                  onTap: () {},
                  iconPath: AppAssets.ordersIcon,
                  title: 'طلباتي'),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              SettingsElementCard(
                  onTap: () {},
                  iconPath: AppAssets.ordersIcon,
                  title: 'طلباتي'),
            ],
          ),
        ),
      ),
    );
  }
}
