import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';

import '../../../home/domain/entities/product.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsBody(
        product: product,
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: Container(
          padding: kDefaultPadding,
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                  height: 40.h,
                  padding: kSecondaryPadding,
                  decoration: kDefaultBoxDecoration.copyWith(
                      color: AppColorsLight.kAppPrimaryColorLight,
                      borderRadius: BorderRadius.circular(17)),
                  child: CustomSvgIcon(
                    iconPath: AppAssets.notificationIcon,
                    color: Colors.white,
                    height: 10.5.h,
                    width: 12.w,
                  ),
                )),
            mediumHorizontalSpace,
            Expanded(
              flex: 6,
              child: YaBalashCustomButton(
                isSecondaryButton: true,
                onTap: () {},
                child: const Text('+ اضف الى السلة'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
