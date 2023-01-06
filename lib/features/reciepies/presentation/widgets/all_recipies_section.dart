import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_card.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import 'reciepie_card.dart';

class AllRecipiesSection extends StatelessWidget {
  const AllRecipiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(text: 'طبختك علي قد ايدك!'),
        smallVerticalSpace,
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const RecipieCard();
          },
        )
      ],
    );
  }
}
