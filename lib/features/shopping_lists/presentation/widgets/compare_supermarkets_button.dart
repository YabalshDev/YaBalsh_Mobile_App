import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';

class CompareSupermarketsButton extends StatelessWidget {
  const CompareSupermarketsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return YaBalashCustomButton(
      child: const Text('قارن كل السوبر ماركتس'),
      onTap: () {
        Get.toNamed(RouteHelper.getSupermarketsRoute());
      },
    );
  }
}
