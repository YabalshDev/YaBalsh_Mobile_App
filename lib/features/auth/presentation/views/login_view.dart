import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';
import 'package:yabalash_mobile_app/core/widgets/phone_number_text_field.dart';
import 'package:yabalash_mobile_app/core/widgets/yaBalash_text_field.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';

import '../../../../core/theme/light/app_colors_light.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginBody()),
    );
  }
}

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
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'رقم الهاتف',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 13.sp),
                    ),
                    mediumVerticalSpace,
                    const PhoneTextField(),
                    mediumVerticalSpace,
                    Text(
                      'كلمة المرور',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 13.sp),
                    ),
                    mediumVerticalSpace,
                    const YaBalashTextField(
                      name: 'password',
                      isWithBorder: true,
                      obsecure: true,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(13),
                        child: CustomSvgIcon(
                          iconPath: AppAssets.eyeIcon,
                          color: Color(0xffBCBDBF),
                        ),
                      ),
                    )
                  ],
                )),
                largeVerticalSpace,
                mediumVerticalSpace,
                YaBalashCustomButton(
                  title: 'تسجيل الدخول',
                  onTap: () {},
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
