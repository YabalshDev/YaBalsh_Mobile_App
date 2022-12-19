import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_assets.dart';
import '../constants/app_layouts.dart';
import '../theme/light/light_theme.dart';
import 'custom_svg_icon.dart';

class CartQuantityRow extends StatelessWidget {
  final int quantity;
  const CartQuantityRow({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        quantity == 1
            ? const CustomSvgIcon(
                iconPath: AppAssets.binIcon,
                color: Colors.red,
              )
            : Icon(
                Icons.remove,
                color: Colors.red,
                size: 18.h,
              ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: kDefaultBoxDecoration.copyWith(
              color: Colors.white, borderRadius: kSecondaryBorderRaduis),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '$quantity',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Icon(
          Icons.add,
          color: Colors.green.shade400,
          size: 18.h,
        ),
      ],
    );
  }
}
