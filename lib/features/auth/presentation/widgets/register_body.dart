import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/register_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/register_form.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';
import '../blocs/cubit/register_cubit.dart';
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

              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return YaBalashCustomButton(
                    isDisabled: state.isButtonDisabled,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.find<RegisterCubit>().changeFormFieldError(false);
                        final registerBody = RegisterRequestModel(
                            email:
                                _formKey.currentState!.fields['email']!.value,
                            firstName: _formKey
                                .currentState!.fields['firstName']!.value,
                            lastName: _formKey
                                .currentState!.fields['lastName']!.value,
                            password: _formKey
                                .currentState!.fields['password']!.value,
                            phoneNumber: _formKey
                                .currentState!.fields['phoneNumber']!.value);

                        print(registerBody);

                        Get.find<RegisterCubit>()
                            .registerUser(registerCredntials: registerBody);
                      } else if (!_formKey
                          .currentState!.fields['password']!.isValid) {
                        Get.find<RegisterCubit>().changeFormFieldError(true);
                      }
                    },
                    child: const Text('انشاء الحساب'),
                  );
                },
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
