import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/address_form.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../auth/presentation/widgets/auth_back_icon.dart';
import '../../../auth/presentation/widgets/auth_title_widget.dart';
import '../../domain/entities/address.dart';

class UpdateAddressBody extends StatelessWidget {
  final Address? address;
  final bool isFromEdit;
  final String fromRoute;
  final GlobalKey<FormBuilderState> formkey;
  const UpdateAddressBody(
      {super.key,
      this.address,
      required this.isFromEdit,
      required this.formkey,
      required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthBackIcon(onTap: () {
                if (fromRoute == RouteHelper.getAddressesRoute()) {
                  Get.offNamed(fromRoute);
                } else {
                  Get.back();
                }
              }),
              largeVerticalSpace,
              const AuthTitleWidget(
                title: 'حابب نوصلك فين؟',
              ),
              largeVerticalSpace,
              AddressForm(
                isFromEdit: isFromEdit,
                address: address,
                formkey: formkey,
                context: context,
              )
            ],
          ),
        ),
      ),
    );
  }
}
