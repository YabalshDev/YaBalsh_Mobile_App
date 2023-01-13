import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/auth_back_icon.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/widgets/sub_zone_list.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../domain/entities/main_zone.dart';

class SubZonesBody extends StatelessWidget {
  final MainZone mainZone;
  const SubZonesBody({super.key, required this.mainZone});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthBackIcon(),
            mediumVerticalSpace,
            Text(
              'اختار منطقة',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
            ),
            largeVerticalSpace,
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'اختار من ',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: mainZone.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 20.sp,
                        color: AppColorsLight.kAppPrimaryColorLight)),
              ]),
            ),
            smallVerticalSpace,
            SubZoneList(
              mainZone: mainZone,
            )
          ],
        ),
      ),
    );
  }
}
