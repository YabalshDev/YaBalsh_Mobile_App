import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_form_section.dart';
import 'package:yabalash_mobile_app/core/widgets/phone_number_text_field.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/privacy_policy_text.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';

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
                            child: CustomFormSection(
                              title: Text(
                                'الاسم الاول',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                              ),
                              name: 'firstName',
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'الاسم الاول مطلوب')
                              ]),
                            )),
                        mediumHorizontalSpace,
                        Expanded(
                            flex: 1,
                            child: CustomFormSection(
                              title: Text(
                                'الاسم الاخير',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                              ),
                              name: 'lastName',
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'الاسم الاخير مطلوب')
                              ]),
                            ))
                      ],
                    ),
                    mediumVerticalSpace,
                    CustomFormSection(
                      title: Row(
                        children: [
                          Text(
                            'البريد الالكتروني',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp),
                          ),
                          Text(
                            '(إختياري)',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: AppColorsLight.kTextFieldBorderColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp),
                          ),
                        ],
                      ),
                      name: 'email',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.email(errorText: 'نسيت علامة @')
                      ]),
                    ),
                    mediumVerticalSpace,
                    CustomFormSection(
                      title: Text(
                        'كلمة المرور',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 13.sp),
                      ),
                      name: 'password',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'كلمة السر مطلوبة'),
                        FormBuilderValidators.minLength(6,
                            errorText: 'كلمة المرور لازم تكون أكثر من 6 حروف'),
                      ]),
                      obsecure: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(13),
                        child: InkWell(
                          onTap: () {
                            // if (state.obsecure!) {
                            //   Get.find<LoginCubit>().changeObsecure(false);
                            // } else {
                            //   Get.find<LoginCubit>().changeObsecure(true);
                            // }
                          },
                          child: const CustomSvgIcon(
                            iconPath: AppAssets.eyeIcon,
                            color: Color(0xffBCBDBF),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

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

              Padding(
                padding: EdgeInsets.only(top: 60.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'لديك مشكلة للدخول إلي حسابك؟',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          color: AppColorsLight.kAppPrimaryColorLight),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
