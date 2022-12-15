import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/kew_word_products.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/Title_row.dart';

import '../../../../core/constants/app_layouts.dart';
import 'price_comparison_section.dart';
import 'product_image_card.dart';
import 'product_kewords_card.dart';

class ProductDetailsBody extends StatelessWidget {
  final Product product;
  const ProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
              child: Padding(
                padding: kDefaultPadding,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColorsLight.kAppPrimaryColorLight,
                  ),
                ),
              ),
            ),
            ProductImageCard(imagePath: product.imagePath!),
            Text(
              product.name!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColorsLight.kAppPrimaryColorLight,
                  fontWeight: FontWeight.w700),
            ),
            smallVerticalSpace,
            ProductKewordCards(productName: product.name!),
            mediumVerticalSpace,
            Text(
              AppStrings.discoverComparePrices,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            PriceComparisonSection(product: product),
            mediumVerticalSpace,
            TitleRow(
              title: 'ممكن كمان يعجبك',
              fontWeight: FontWeight.w800,
              padding: kDefaultPadding.copyWith(right: 2.w),
            ),
            mediumVerticalSpace,

            SizedBox(height: 280.h, child: KewordProducts(products: [product]))

            // KewordSection(order: order)
          ],
        ),
      ),
    );
  }
}
