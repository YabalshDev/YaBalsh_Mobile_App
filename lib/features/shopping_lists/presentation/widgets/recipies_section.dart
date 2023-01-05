import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../home/presentation/widgets/Title_row.dart';

class RecipiesSection extends StatelessWidget {
  const RecipiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleRow(
          title: 'طبختك علي اد ايدك !',
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          fontWeight: FontWeight.w700,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'اختار الوصفة, مقادير باقل الاسعار',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: AppColorsLight.kAppPrimaryColorLight),
          ),
        ),
        mediumVerticalSpace,
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            key: UniqueKey(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90.w,
                      height: 90.h,
                      child: ClipRRect(
                        borderRadius: kSecondaryBorderRaduis,
                        child: Image.asset(
                          AppAssets.recipieImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 90.w),
                      child: Text(
                        'سبرنج رول بالزعتر',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColorsLight.kAppPrimaryColorLight),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
