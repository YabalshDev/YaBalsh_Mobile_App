import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/shopping_list_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../domain/entities/shopping_list.dart';
import 'products_grid.dart';

class ShoppingListCard extends StatelessWidget {
  final ShoppingList shoppingList;
  const ShoppingListCard({super.key, required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        yaBalashCustomDialog(
          buttonTitle: 'تاكيد',
          isWithEmoji: false,
          onClose: () {
            BlocProvider.of<ShoppingListCubit>(context)
                .handleDialogAfterDismiss(shoppingList);
          },
          title: 'ملاحظة',
          mainContent: 'هل انت متاكد من حذف القائمة؟',
          onConfirm: () {
            BlocProvider.of<ShoppingListCubit>(context)
                .removeShoppingList(shoppingList);
            Get.back();
          },
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(
          color: AppColorsLight.kErrorColor,
        ),
        padding: kDefaultPadding,
        child: Row(
          children: const [
            CustomSvgIcon(
              iconPath: AppAssets.binIcon,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteHelper.getShoppingListDetailsRoute(),
              arguments: [shoppingList]);
        },
        child: Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShoppingListProductsCard(shoppingList: shoppingList),
                  mediumHorizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoppingList.name!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColorsLight.kAppPrimaryColorLight),
                      ),
                      smallVerticalSpace,
                      Text(
                        '${shoppingList.products!.length} منتجات',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColorsLight.kAppPrimaryColorLight
                                .withOpacity(0.6)),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.h,
                color: AppColorsLight.kAppPrimaryColorLight.withOpacity(0.8),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShoppingListProductsCard extends StatelessWidget {
  const ShoppingListProductsCard({
    Key? key,
    required this.shoppingList,
  }) : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 65.h,
        height: 65.h,
        decoration: kDefaultBoxDecoration.copyWith(
            border: Border.all(color: Colors.transparent),
            color: AppColorsLight.kDisabledButtonColor),
        child: ProductsGrid(shoppingList: shoppingList));
  }
}
