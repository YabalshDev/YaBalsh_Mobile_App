import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/phone_number_text_field.dart';
import '../../../auth/presentation/widgets/auth_back_icon.dart';
import '../../../auth/presentation/widgets/auth_title_widget.dart';

final _formKey = GlobalKey<FormBuilderState>();

class UpdateAddressBody extends StatelessWidget {
  const UpdateAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            children: [
              const AuthBackIcon(),
              largeVerticalSpace,
              const AuthTitleWidget(
                title: 'حابب نوصلك فين؟',
              ),
              largeVerticalSpace,
              FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'رقم الهاتف',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 13.sp),
                      ),
                      mediumVerticalSpace,
                      const PhoneTextField(
                        intialValue: '01033266355',
                        readOnly: true,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
