import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_network_image.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../reciepies/domain/entities/recipie.dart';

class RecipieShoppingListCard extends StatelessWidget {
  final Recipie recipie;
  const RecipieShoppingListCard({
    Key? key,
    required this.recipie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.toNamed(RouteHelper.getRecipieDetailsRoute(), arguments: recipie),
      child: Container(
        margin: EdgeInsets.only(left: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 90.w,
              height: 90.h,
              child: ClipRRect(
                  borderRadius: kSecondaryBorderRaduis,
                  child: AppImage(
                    path: recipie.imagePath,
                    fit: BoxFit.contain,
                  )),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 90.w),
              child: Text(
                recipie.title!,
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
      ),
    );
  }
}
