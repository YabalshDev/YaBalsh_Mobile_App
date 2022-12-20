import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_network_image.dart';

class CustomCard extends StatelessWidget {
  final Color? backgroundColor;
  final String? imagePath;
  final bool? withBorder;
  final double? width;
  final double? height;
  final bool? isAssetImage;
  const CustomCard(
      {super.key,
      this.withBorder = true,
      this.isAssetImage = true,
      this.width,
      this.height,
      this.backgroundColor = Colors.transparent,
      this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width ?? 60.w,
      height: height ?? 60.h,
      decoration: kDefaultBoxDecoration.copyWith(
          color: backgroundColor,
          border: !withBorder! ? Border.all(color: Colors.transparent) : null),
      child: ClipRRect(
          borderRadius: kDefaultBorderRaduis,
          child: isAssetImage!
              ? Image.asset(imagePath!)
              : AppImage(
                  path: imagePath,
                  fit: BoxFit.contain,
                )),
    );
  }
}
