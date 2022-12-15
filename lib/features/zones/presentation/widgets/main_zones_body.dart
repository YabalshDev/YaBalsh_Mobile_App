import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/main_zones.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/widgets/main_zone_card.dart';
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
              const Icon(
                Icons.arrow_back_ios,
                color: AppColorsLight.kAppPrimaryColorLight,
              ),
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
              Text(
                'او اختار منطقتك',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 13.sp, color: Colors.grey),
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              ListView.builder(
                itemCount: mainZones.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final mainZone = mainZones[index];
                  return MainZoneCard(
                    mainZone: mainZone,
                    length: mainZones.length,
                    index: index,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
