import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
      ),
    );
  }
}
