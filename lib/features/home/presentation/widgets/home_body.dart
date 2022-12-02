import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_svg_icon.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSvgIcon(
          iconPath: 'assets/icons/notification.svg',
          height: 23.h,
          width: 27.w,
        ),
        const Center(
          child: Text('homeView'),
        ),
      ],
    );
  }
}
