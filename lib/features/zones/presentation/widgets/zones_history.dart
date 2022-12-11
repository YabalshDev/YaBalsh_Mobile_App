import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class ZonesHistory extends StatelessWidget {
  const ZonesHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'آخر المناطق الي اخترتها',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 13.sp, color: Colors.grey),
        ),
        smallVerticalSpace,
        Divider(
          color: Colors.grey.shade300,
          thickness: 1,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
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
                        Text('القاهرة',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 13.sp,
                                )),
                        Text('التجمع الخامس',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
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
          },
        ),
      ],
    );
  }
}
