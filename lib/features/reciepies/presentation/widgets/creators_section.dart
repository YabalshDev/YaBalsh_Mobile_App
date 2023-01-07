import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/sub_heading.dart';
import 'creator_card.dart';

class CreatorsSection extends StatelessWidget {
  const CreatorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(
          text: 'وصفات من طهاة و ماركات',
          isBold: false,
        ),
        mediumVerticalSpace,
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.toNamed(RouteHelper.getCreatorDetailsRoute()),
                child: const CreatorCard(),
              );
            },
          ),
        )
      ],
    );
  }
}
