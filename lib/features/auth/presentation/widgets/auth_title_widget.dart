import 'package:flutter/material.dart';

import '../../../../core/theme/light/app_colors_light.dart';

class AuthTitleWidget extends StatelessWidget {
  final String? title;
  const AuthTitleWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
    );
  }
}
