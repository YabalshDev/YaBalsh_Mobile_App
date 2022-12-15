import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageCard extends StatelessWidget {
  final String imagePath;
  const ProductImageCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Center(
        child: SizedBox(
          height: 196.h,
          width: 164.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
