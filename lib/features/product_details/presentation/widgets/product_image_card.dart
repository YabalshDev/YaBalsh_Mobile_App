import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_network_image.dart';

class ProductImageCard extends StatelessWidget {
  final String imagePath;
  const ProductImageCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 196.h,
        width: 164.w,
        child: AppImage(
          path: imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
