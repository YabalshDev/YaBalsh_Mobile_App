import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_header.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/services/app_settings_service.dart';
import 'all_supermarkets_section.dart';

class SuperMarketLists extends StatelessWidget {
  const SuperMarketLists({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getIt<AppSettingsService>().appVersion == '1.0.0'
              ? const CustomHeader(
                  title: 'السوبر ماركتس',
                  iconPath: AppAssets.backIcon,
                )
              : const SizedBox(),
          const AllSupermarketsSection(),
        ],
      ),
    );
  }
}
