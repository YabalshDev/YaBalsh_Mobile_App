import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/widgets/main_zones_section.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/widgets/zones_history.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';

class MainZonesBody extends StatelessWidget {
  const MainZonesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mediumVerticalSpace,
              Text(
                'اختار منطقة',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
              ),
              largeVerticalSpace,
              const ZonesHistory(),
              mediumVerticalSpace,
              const MainZonesSection()
            ],
          ),
        ),
      ),
    );
  }
}
