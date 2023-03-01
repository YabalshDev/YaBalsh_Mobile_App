import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_assets.dart';
import 'custom_svg_icon.dart';

class StockIcon extends StatelessWidget {
  const StockIcon({super.key, required this.isAvailable});
  final bool isAvailable;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 22.w,
        height: 12.h,
        child: CustomSvgIcon(
          iconPath: isAvailable
              ? AppAssets.inStockIconSvg
              : AppAssets.outOfStockIconSvg,
          boxFit: BoxFit.fill,
        ));
  }
}
