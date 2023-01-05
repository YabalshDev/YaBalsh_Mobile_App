import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/sub_heading.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(text: 'الدفع'),
        largeHorizontalSpace,
        largeHorizontalSpace,
        smallHorizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallVerticalSpace,
            Text(
              'طريقة الدفع',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'الدفع عند الاستلام',
              maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
            ),
          ],
        )
      ],
    );
  }
}
