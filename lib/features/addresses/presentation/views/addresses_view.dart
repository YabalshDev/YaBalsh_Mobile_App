import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/addresses_body.dart';

import '../../../../core/routes/app_routes.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const AddressesBody(),
        bottomNavigationBar: CustomNavBar(
            isButtonSecondary: false,
            title: '+ اضف عنوانا',
            mainButtonTap: () => Get.toNamed(RouteHelper.getUpdateAddress(),
                arguments: [false, null, RouteHelper.getAddressesRoute()]))
        //         arguments: [false, null]) ,),
        // bottomNavigationBar: Container(
        //   height: 70.h,
        //   padding: kDefaultPadding,
        //   child: YaBalashCustomButton(
        //     isSecondaryButton: false,
        //     onTap: () => Get.toNamed(RouteHelper.getUpdateAddress(),
        //         arguments: [false, null]),
        //     child: const Text('+ اضف عنوانا'),
        //   ),
        // ),
        );
  }
}
