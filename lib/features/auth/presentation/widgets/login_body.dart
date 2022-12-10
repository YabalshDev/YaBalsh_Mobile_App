import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../../core/widgets/phone_number_text_field.dart';
import '../../../../core/widgets/yaBalash_text_field.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';
import '../blocs/cubit/login_cubit.dart';

final _formKey = GlobalKey<FormBuilderState>();

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 180.h,
                ),
                Text(
                  'ايه هي كلمة السر؟',
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 13.sp),
                        ),
                        mediumVerticalSpace,
                        const PhoneTextField(
                          intialValue: '01033266355',
                          readOnly: true,
                        ),
                        mediumVerticalSpace,
                        Text(
                          'كلمة المرور',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 13.sp),
                        ),
                        mediumVerticalSpace,
                        BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) =>
                              previous.obsecure != current.obsecure,
                          builder: (context, state) {
                            return YaBalashTextField(
                              name: 'password',
                              isWithBorder: true,
                              obsecure: state.obsecure,
                              suffixIcon: const Padding(
                                padding: EdgeInsets.all(13),
                                child: CustomSvgIcon(
                                  iconPath: AppAssets.eyeIcon,
                                  color: Color(0xffBCBDBF),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    )),
                largeVerticalSpace,
                mediumVerticalSpace,
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.isButtonDisabled != current.isButtonDisabled,
                  builder: (context, state) {
                    return YaBalashCustomButton(
                      title: 'تسجيل الدخول',
                      isDisabled: state.isButtonDisabled,
                      onTap: () {},
                    );
                  },
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: kDefaultPadding,
          child: const Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColorsLight.kAppPrimaryColorLight,
            ),
          ),
        ),
        Padding(
          padding: kDefaultPadding.copyWith(bottom: 40.h),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'لديك مشكلة للدخول إلي حسابك؟',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: AppColorsLight.kAppPrimaryColorLight),
            ),
          ),
        )
      ],
    );
  }
}
