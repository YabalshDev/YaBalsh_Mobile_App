import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class ZoneHistoryCard extends StatelessWidget {
  final SubZone subZone;
  const ZoneHistoryCard({super.key, required this.subZone});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CustomSvgIcon(
              iconPath: AppAssets.historyIcon,
              color: Colors.grey,
            ),
            mediumHorizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subZone.mainZoneName ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13.sp,
                        )),
                Text(subZone.name ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700)),
              ],
            )
          ],
        ),
        Divider(
          color: Colors.grey.shade300,
          thickness: 1,
        ),
      ],
    );
  }
}
