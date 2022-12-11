import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../widgets/register_body.dart';

final _formKey = GlobalKey<FormBuilderState>();

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RegisterBody(),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.h),
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
        ),
      ),
    );
  }
}
