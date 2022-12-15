import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/light/app_colors_light.dart';

class AuthBackIcon extends StatelessWidget {
  const AuthBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.arrow_back_ios,
        color: AppColorsLight.kAppPrimaryColorLight,
      ),
    );
  }
}
