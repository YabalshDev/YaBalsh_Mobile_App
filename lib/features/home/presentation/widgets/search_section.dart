import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScaffoldPadding.copyWith(right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {},
              child: Card(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 5.w),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: AppColorsLight.kDisabledButtonTextColor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'دور علي منتج او سوبر ماركت',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColorsLight.kDisabledButtonTextColor),
                    )
                  ],
                ),
              )),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            flex: 1,
            child: Card(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 2.w),
                  child: CustomSvgIcon(
                    iconPath: AppAssets.barcodeIcon,
                    height: 26.h,
                    width: 20.h,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
