import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/register_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/auth_back_icon.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/auth_title_widget.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/register_form.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';
import '../blocs/cubit/register_cubit.dart';
import 'privacy_policy_text.dart';

final _formKey = GlobalKey<FormBuilderState>();

class RegisterBody extends StatelessWidget {
  final String phoneNumber;
  final String fromRoute;
  const RegisterBody(
      {super.key, required this.phoneNumber, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      bottom: true,
      child: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthBackIcon(),
              mediumVerticalSpace,
              const AuthTitleWidget(
                title: 'إنشاء حساب جديد',
              ),
              largeVerticalSpace,

              RegisterForm(formKey: _formKey, phoneNumber: phoneNumber),
              largeVerticalSpace,
              largeVerticalSpace,

              // register button

              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return YaBalashCustomButton(
                    isDisabled: state.isButtonDisabled,
                    onTap: () {
                      if (!state.isButtonDisabled!) {
                        if (_formKey.currentState!.validate()) {
                          handleValidRegsiterRequest(context);
                        } else if (!_formKey
                            .currentState!.fields['password']!.isValid) {
                          BlocProvider.of<RegisterCubit>(context)
                              .changeFormFieldError(true);
                        }
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

  void handleValidRegsiterRequest(BuildContext context) {
    BlocProvider.of<RegisterCubit>(context).changeFormFieldError(false);
    RegisterRequestModel? registerBody;

    registerBody = RegisterRequestModel(
        email: _formKey.currentState!.fields['email']!.value ??
            'example@yabalash.net',
        firstName: _formKey.currentState!.fields['firstName']!.value,
        lastName: _formKey.currentState!.fields['lastName']!.value,
        password: _formKey.currentState!.fields['password']!.value,
        phoneNumber: _formKey.currentState!.fields['phoneNumber']!.value);

    BlocProvider.of<RegisterCubit>(context)
        .registerUser(registerCredntials: registerBody, fromRoute: fromRoute);
  }
}
