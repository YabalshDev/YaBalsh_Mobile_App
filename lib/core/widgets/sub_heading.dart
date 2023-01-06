import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubHeading extends StatelessWidget {
  final String text;
  final bool? isBold;
  const SubHeading({super.key, required this.text, this.isBold = true});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: !isBold! ? FontWeight.w600 : FontWeight.w700,
          fontSize: 17.sp),
    );
  }
}
