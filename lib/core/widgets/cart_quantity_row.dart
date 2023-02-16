import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_assets.dart';
import '../constants/app_layouts.dart';
import '../theme/light/light_theme.dart';
import 'custom_svg_icon.dart';

class CartQuantityRow extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;
  final bool? fromProductDetails;
  const CartQuantityRow(
      {super.key,
      this.fromProductDetails,
      required this.quantity,
      required this.onIncrement,
      required this.onDecrement,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        quantity == 1
            ? InkWell(
                onTap: onDelete,
                child: CustomSvgIcon(
                  iconPath: AppAssets.binIcon,
                  color: Colors.red,
                  height: fromProductDetails != null ? 25.h : null,
                  width: fromProductDetails != null ? 25.w : null,
                ),
              )
            : InkWell(
                onTap: onDecrement,
                child: Icon(
                  Icons.remove,
                  color: Colors.red,
                  size: fromProductDetails != null ? 25.h : 20.h,
                ),
              ),
        Container(
          width: fromProductDetails != null ? 30.h : 25.h,
          height: fromProductDetails != null ? 35.h : 30.h,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: kDefaultBoxDecoration.copyWith(
              color: Colors.white, borderRadius: kSecondaryBorderRaduis),
          child: Center(
            child: Text(
              '$quantity',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: fromProductDetails != null ? 17.sp : 13.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        InkWell(
          onTap: onIncrement,
          child: Icon(
            Icons.add,
            color: Colors.green.shade400,
            size: fromProductDetails != null ? 25.h : 20.h,
          ),
        ),
      ],
    );
  }
}
