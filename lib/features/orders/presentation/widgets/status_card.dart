import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';

class StatusCard extends StatelessWidget {
  final String status;
  const StatusCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kDefaultBoxDecoration.copyWith(
          color: AppColorsLight.warningColor,
          border: Border.all(color: Colors.transparent)),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Text(
        status == 'pending' ? "قيد التوصيل" : '',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
