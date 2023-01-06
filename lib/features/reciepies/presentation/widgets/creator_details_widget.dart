import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';

class CreatorDetailsWidget extends StatelessWidget {
  const CreatorDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: CustomCard(
              withBorder: false,
              isAssetImage: true,
              imagePath: AppAssets.ulker,
            ),
          ),
          smallHorizontalSpace,
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('غريبة بالفستق و النوتيلا',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorsLight.kAppPrimaryColorLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp)),
                mediumVerticalSpace,
                Text('خلي طاولة إفطارك كلها إبداع، تكفي ل 10 أشخاص',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight
                              .withOpacity(0.6),
                        )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
