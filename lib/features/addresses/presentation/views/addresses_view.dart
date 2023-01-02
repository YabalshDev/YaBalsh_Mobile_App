import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/addresses_body.dart';

import '../../../../core/routes/app_routes.dart';

class AddressesView extends StatelessWidget {
  final String fromRoute;
  const AddressesView({super.key, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AddressesBody(fromRoute: fromRoute),
        bottomNavigationBar: CustomNavBar(
            isButtonSecondary: false,
            title: '+ اضف عنوانا',
            mainButtonTap: () => Get.toNamed(RouteHelper.getUpdateAddress(),
                arguments: [false, null, fromRoute])));
  }
}
