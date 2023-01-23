import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/utils/order_status_map.dart';

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
          color: status == 'completed'
              ? Colors.green.shade400
              : AppColorsLight.warningColor,
          border: Border.all(color: Colors.transparent)),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Text(
        orderStatus[status] ?? '',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
