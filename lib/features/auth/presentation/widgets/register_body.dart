import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/register_form.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';
import 'privacy_policy_text.dart';

final _formKey = GlobalKey<FormBuilderState>();

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

              RegisterForm(formKey: _formKey),
              largeVerticalSpace,
              largeVerticalSpace,

              // register button

              YaBalashCustomButton(
                isDisabled: false,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print('success');
                  }
                },
                child: const Text('انشاء الحساب'),
              ),
              mediumVerticalSpace,
              const PrivacyPolicyText(),
            ],
          ),
        ),
      ),
    );
  }
}
