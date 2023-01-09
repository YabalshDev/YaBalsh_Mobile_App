import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../domain/entities/recipie.dart';

class CreatorDetailsWidget extends StatelessWidget {
  final Recipie recipie;
  const CreatorDetailsWidget({super.key, required this.recipie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CustomCard(
              withBorder: false,
              isAssetImage: true,
              imagePath: recipie.creatorImagePath,
            ),
          ),
          smallHorizontalSpace,
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipie.title!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorsLight.kAppPrimaryColorLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp)),
                mediumVerticalSpace,
                Text(recipie.subTitle!,
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
