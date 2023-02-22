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
  final double? borderRadius;
  final BoxFit? fit;
  const CustomCard(
      {super.key,
      this.withBorder = true,
      this.isAssetImage = true,
      this.borderRadius,
      this.fit,
      this.width,
      this.height,
      this.backgroundColor = Colors.transparent,
      this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width ?? 65.w,
      height: height ?? 65.h,
      decoration: kDefaultBoxDecoration.copyWith(
          color: backgroundColor,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
          border: !withBorder! ? Border.all(color: Colors.transparent) : null),
      child: ClipRRect(
          borderRadius: kDefaultBorderRaduis,
          child: isAssetImage!
              ? Image.asset(imagePath!)
              : AspectRatio(
                  aspectRatio: 1,
                  child: AppImage(
                    path: imagePath ?? '',
                    fit: fit ?? BoxFit.fill,
                  ),
                )),
    );
  }
}
