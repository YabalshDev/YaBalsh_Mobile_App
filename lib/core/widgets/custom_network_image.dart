import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/app_assets.dart';
import 'custom_image_loader.dart';

class AppImage extends StatelessWidget {
  final BoxFit? fit;
  final String? path;
  final double? height;
  final double? width;
  final Widget? placeHolder;

  const AppImage(
      {super.key,
      this.fit = BoxFit.cover,
      this.height,
      this.width,
      this.placeHolder,
      this.path = ""});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path ?? '',
      fit: fit,
      progressIndicatorBuilder: (context, url, progress) =>
          const CustomImageLoader(),
      errorWidget: (context, url, error) => Image.asset(
        AppAssets.splash,
        fit: BoxFit.contain,
      ),
    );
  }
}
