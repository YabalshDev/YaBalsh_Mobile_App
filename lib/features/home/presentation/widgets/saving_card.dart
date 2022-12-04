import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';

class SavingCard extends StatelessWidget {
  final String percentage;
  const SavingCard({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: kDefaultBoxDecoration.copyWith(
          borderRadius: BorderRadius.circular(8),
          color: AppColorsLight.kOfferBackgroundColor),
      child: Text(
        'توفير $percentage%',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.green.shade600, fontWeight: FontWeight.w600),
      ),
    );
  }
}
