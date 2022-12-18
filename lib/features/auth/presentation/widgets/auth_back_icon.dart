import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/light/app_colors_light.dart';

class AuthBackIcon extends StatelessWidget {
  final VoidCallback? onTap;
  const AuthBackIcon({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            Get.back();
          },
      child: const Icon(
        Icons.arrow_back_ios,
        color: AppColorsLight.kAppPrimaryColorLight,
      ),
    );
  }
}
