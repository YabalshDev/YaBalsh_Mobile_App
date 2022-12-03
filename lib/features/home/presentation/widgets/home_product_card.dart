import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';

class HomeProductCard extends StatelessWidget {
  final Product product;
  const HomeProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      child: Stack(
        children: [
          Container(
              width: 133.w, height: 290.h, decoration: kDefaultBoxDecoration),
          Positioned(
            top: 0,
            child: Container(
              width: 133.w,
              padding: kDefaultPadding,
              decoration: kDefaultBoxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          height: 140.h,
                          width: 133.h,
                          child: Image.asset(product.imagePath!)),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: kDefaultBoxDecoration.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColorsLight.kOfferBackgroundColor),
                          child: Text(
                            'توفير 20%',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Colors.green.shade600,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100.h,
                        left: 0,
                        child: Container(
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple.shade700),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.sp,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    product.name!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColorsLight.kAppPrimaryColorLight,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'جنيه ${product.prices!['كارفور']!.price!}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColorsLight.kAppPrimaryColorLight,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                              product.prices!['كارفور']!.storeImagePath!)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
