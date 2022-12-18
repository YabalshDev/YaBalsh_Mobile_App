import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/addresses_body.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AddressesBody(),
      bottomNavigationBar: Container(
        height: 70.h,
        padding: kDefaultPadding,
        child: YaBalashCustomButton(
          isSecondaryButton: false,
          onTap: () => Get.toNamed(RouteHelper.getUpdateAddress(),
              arguments: [false, null]),
          child: const Text('+ اضف عنوانا'),
        ),
      ),
    );
  }
}
