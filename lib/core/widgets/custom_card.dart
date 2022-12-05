import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';

class CustomCard extends StatelessWidget {
  final Color? backgroundColor;
  final String? imagePath;
  const CustomCard(
      {super.key, this.backgroundColor = Colors.transparent, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
      width: 60.w,
      height: 60.h,
      decoration: kDefaultBoxDecoration.copyWith(
          color: backgroundColor,
          border: Border.all(color: Colors.transparent)),
      child: Center(child: Image.asset(imagePath!)),
    );
  }
}
