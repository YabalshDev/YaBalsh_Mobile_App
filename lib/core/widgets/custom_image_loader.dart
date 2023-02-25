import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/app_layouts.dart';
import '../theme/light/app_colors_light.dart';

class CustomImageLoader extends StatelessWidget {
  const CustomImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Container(
        decoration: BoxDecoration(
            color: AppColorsLight.kMainCategoryCardColor,
            borderRadius: kDefaultBorderRaduis),
      ),
    );
  }
}
