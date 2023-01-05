import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/sub_heading.dart';

class DeliveryDetailsSection extends StatelessWidget {
  final Address address;
  const DeliveryDetailsSection({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(text: 'التوصيل'),
        mediumHorizontalSpace,
        mediumHorizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallVerticalSpace,
            Text(
              'عنوان التوصيل',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: Get.width * 0.5),
              child: Text(
                '${address.fullAddress}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color:
                        AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
              ),
            ),
            Text(
              'رقم المبني ${address.buildingNo}، رقم الدور ${address.floor}, رقم الشقة ${address.apartmentNo}',
              maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.7)),
            ),
          ],
        )
      ],
    );
  }
}
