import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/phone_number_text_field.dart';
import 'package:yabalash_mobile_app/core/widgets/yaBalash_text_field.dart';

import '../../../../core/theme/light/app_colors_light.dart';

final _formKey = GlobalKey<FormBuilderState>();

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RegisterBody());
  }
}

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: AppColorsLight.kAppPrimaryColorLight,
              ),
              mediumVerticalSpace,
              Text(
                'إنشاء حساب جديد',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
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
                      intialValue: '01033266455',
                      readOnly: true,
                    ),
                    largeVerticalSpace,
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الاسم الاول',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                              ),
                              mediumVerticalSpace,
                              const YaBalashTextField(
                                name: 'firstName',
                              )
                            ],
                          ),
                        ),
                        mediumHorizontalSpace,
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الاسم الاخير',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                              ),
                              mediumVerticalSpace,
                              const YaBalashTextField(
                                name: 'lastName',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    mediumVerticalSpace,
                    Text(
                      'البريد الالكتروني',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 13.sp),
                    ),
                    mediumVerticalSpace,
                    const YaBalashTextField(
                      name: 'email',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
