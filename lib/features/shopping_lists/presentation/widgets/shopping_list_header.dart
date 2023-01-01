import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/shopping_list_bottom_modal.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/cubit/shopping_list_details_cubit.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../../domain/entities/shopping_list.dart';

final formKey = GlobalKey<FormBuilderState>();

class ShoppingListHeader extends StatelessWidget {
  final ShoppingList shoppingList;
  const ShoppingListHeader({super.key, required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    void handleRenameShoppingList() {
      final name = formKey.currentState?.fields['name']!.value;

      BlocProvider.of<ShoppingListDetailsCubit>(context)
          .renameShoppingList(shoppingList: shoppingList, name: name);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColorsLight.kAppPrimaryColorLight,
            size: 20.h,
          ),
        ),
        const Spacer(),
        BlocBuilder<ShoppingListDetailsCubit, ShoppingListDetailsState>(
            builder: (context, state) {
          return InkWell(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => ShoppingListBottomModal(
                  onTap: () {
                    handleRenameShoppingList();
                  },
                  formKey: formKey),
            ),
            child: Row(
              children: [
                CustomSvgIcon(
                  iconPath: AppAssets.pencilIcon,
                  height: 15.h,
                  width: 15.w,
                  color: AppColorsLight.kAppPrimaryColorLight,
                ),
                smallHorizontalSpace,
                Text(
                  state.shoppingListName ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColorsLight.kAppPrimaryColorLight,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      fontSize: 17.sp),
                ),
              ],
            ),
          );
        }),
        const Spacer()
      ],
    );
  }
}
