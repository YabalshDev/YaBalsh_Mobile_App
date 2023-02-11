import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_shimmer.dart';

class NotificationsLoading extends StatelessWidget {
  const NotificationsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomShimmer(
          height: 80.h,
          width: Get.width,
        );
      },
    );
  }
}
