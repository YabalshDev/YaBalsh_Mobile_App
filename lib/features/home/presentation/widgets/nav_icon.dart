import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/cart_cubit.dart';

import '../../../../core/constants/app_assets.dart';

class NavIcon extends StatelessWidget {
  final String iconPath;
  final int itemIndex;
  final int activeIndex;
  const NavIcon(
      {super.key,
      required this.activeIndex,
      required this.iconPath,
      required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    if (iconPath == AppAssets.cartIcon) {
      return BlocProvider.value(
        value: getIt<CartCubit>(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return CustomSvgIcon(
              iconPath: iconPath,
              color: activeIndex == itemIndex
                  ? AppColorsLight.kAppPrimaryColorLight
                  : Colors.black,
            );
            // if (state.cartItems!.isNotEmpty) {
            //   return Badge(
            //     badgeColor: AppColorsLight.kErrorColor,
            //     position: BadgePosition.topStart(top: 0.1, start: 0.5),
            //     child: CustomSvgIcon(
            //       iconPath: iconPath,
            //       color: activeIndex == itemIndex
            //           ? AppColorsLight.kAppPrimaryColorLight
            //           : Colors.black,
            //     ),
            //   );
            // } else {
            //   return CustomSvgIcon(
            //     iconPath: iconPath,
            //     color: activeIndex == itemIndex
            //         ? AppColorsLight.kAppPrimaryColorLight
            //         : Colors.black,
            //   );
            // }
          },
        ),
      );
    } else {
      return CustomSvgIcon(
        iconPath: iconPath,
        color: activeIndex == itemIndex
            ? AppColorsLight.kAppPrimaryColorLight
            : Colors.black,
      );
    }
  }
}
