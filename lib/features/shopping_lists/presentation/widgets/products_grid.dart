import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../domain/entities/shopping_list.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.shoppingList,
  }) : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    if (shoppingList.products!.length >= 4) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(children: [
                CustomCard(
                  withBorder: false,
                  isAssetImage: false,
                  borderRadius: 6,
                  backgroundColor: Colors.white,
                  width: 23.w,
                  height: 23.h,
                  imagePath: shoppingList.products![0].product!.imagePath,
                ),
                const Spacer(),
                CustomCard(
                  withBorder: false,
                  isAssetImage: false,
                  borderRadius: 6,
                  backgroundColor: Colors.white,
                  width: 23.w,
                  height: 23.h,
                  imagePath: shoppingList.products![1].product!.imagePath,
                ),
              ]),
            ),
            Expanded(
                flex: 1,
                child: Row(children: [
                  CustomCard(
                    withBorder: false,
                    isAssetImage: false,
                    borderRadius: 6,
                    backgroundColor: Colors.white,
                    width: 23.w,
                    height: 23.h,
                    imagePath: shoppingList.products![2].product!.imagePath,
                  ),
                  const Spacer(),
                  CustomCard(
                    withBorder: false,
                    isAssetImage: false,
                    borderRadius: 6,
                    backgroundColor: Colors.white,
                    width: 23.w,
                    height: 23.h,
                    imagePath: shoppingList.products![3].product!.imagePath,
                  ),
                ]))
          ],
        ),
      );
    } else {
      switch (shoppingList.products!.length) {
        case 3:
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  CustomCard(
                    withBorder: false,
                    isAssetImage: false,
                    borderRadius: 6,
                    backgroundColor: Colors.white,
                    width: 23.w,
                    height: 23.h,
                    imagePath: shoppingList.products![0].product!.imagePath,
                  ),
                  const Spacer(),
                  CustomCard(
                    withBorder: false,
                    isAssetImage: false,
                    borderRadius: 6,
                    backgroundColor: Colors.white,
                    width: 23.w,
                    height: 23.h,
                    imagePath: shoppingList.products![1].product!.imagePath,
                  ),
                ]),
                smallVerticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: shoppingList.products!
                      .sublist(2)
                      .map((cartItem) => CustomCard(
                            withBorder: false,
                            isAssetImage: false,
                            borderRadius: 6,
                            backgroundColor: Colors.white,
                            width: 23.w,
                            height: 23.h,
                            imagePath: cartItem.product!.imagePath,
                          ))
                      .toList(),
                )
              ],
            ),
          );

        case 2:
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CustomCard(
                    withBorder: false,
                    isAssetImage: false,
                    borderRadius: 6,
                    backgroundColor: Colors.white,
                    width: 23.w,
                    height: 23.h,
                    imagePath: shoppingList.products![0].product!.imagePath,
                  ),
                  const Spacer(),
                  CustomCard(
                    withBorder: false,
                    isAssetImage: false,
                    borderRadius: 6,
                    backgroundColor: Colors.white,
                    width: 23.w,
                    height: 23.h,
                    imagePath: shoppingList.products![1].product!.imagePath,
                  ),
                ]),
                const Spacer()
              ],
            ),
          );

        case 1:
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 6.w),
            child: CustomCard(
              withBorder: false,
              isAssetImage: false,
              borderRadius: 6,
              backgroundColor: Colors.white,
              width: 65.h,
              height: 65.h,
              imagePath: shoppingList.products![0].product!.imagePath,
            ),
          );

        default:
          return const SizedBox();
      }
    }
  }
}
