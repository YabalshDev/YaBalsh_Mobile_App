import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/services/zone_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScaffoldPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvgIcon(
            iconPath: AppAssets.notificationIcon,
            color: AppColorsLight.kAppPrimaryColorLight,
            height: 27.h,
            width: 23.w,
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "التوصيل الى",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getIt<ZoneService>().currentSubZone?.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  )
                ],
              )
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
