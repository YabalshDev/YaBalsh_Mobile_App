import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/constants/constantdata/main_categories_list.dart';
import '../../../../core/theme/light/app_colors_light.dart';

class LastOfferSection extends StatelessWidget {
  const LastOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: kScaffoldPadding,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: mainCategoriesMock.length,
        itemBuilder: (context, index) {
          final mainCategory = mainCategoriesMock[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                margin: EdgeInsets.only(left: 10.w),
                decoration: BoxDecoration(
                    color: AppColorsLight.kMainCategoryCardColor,
                    borderRadius: kDefaultBorderRaduis),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                            mainCategory.imagePath!,
                            fit: BoxFit.cover,
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'حتى 20% خصم',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                mainCategory.name!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700, color: Colors.black),
              )
            ],
          );
        },
      ),
    );
  }
}
