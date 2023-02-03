import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/auth_back_icon.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/auth_title_widget.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/login_form.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';
import '../blocs/cubit/login_cubit.dart';

final _formKey = GlobalKey<FormBuilderState>();

class LoginBody extends StatelessWidget {
  final String phoneNumber;
  final String fromRoute;
  const LoginBody(
      {super.key, required this.phoneNumber, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        KeyboardVisibilityBuilder(builder: (context, isVisible) {
          return SingleChildScrollView(
            reverse: isVisible ? true : false,
            child: Padding(
              padding: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AuthBackIcon(),
                  SizedBox(
                    height: 160.h,
                  ),
                  const AuthTitleWidget(
                    title: 'ايه هي كلمة السر؟',
                  ),
                  largeVerticalSpace,
                  LoginForm(formKey: _formKey, phoneNumber: phoneNumber),
                  largeVerticalSpace,
                  mediumVerticalSpace,
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.isButtonDisabled != current.isButtonDisabled,
                    builder: (context, state) {
                      return YaBalashCustomButton(
                        isDisabled: state.isButtonDisabled,
                        onTap: () {
                          if (!state.isButtonDisabled!) {
                            if (_formKey.currentState!.validate()) {
                              final loginRequest = LoginRequestModel(
                                  password: _formKey
                                      .currentState!.fields['password']!.value,
                                  phoneNumber: _formKey.currentState!
                                      .fields['phoneNumber']!.value);

                              BlocProvider.of<LoginCubit>(context).loginUser(
                                  loginCredentials: loginRequest,
                                  fromRoute: fromRoute);
                            }
                          }
                        },
                        child: state.loginState == RequestState.loading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Text('تسجيل الدخول'),
                      );
                    },
                  ),
                  SizedBox(
                    height: isVisible ? Get.height * 0.35 : 0,
                  )
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
