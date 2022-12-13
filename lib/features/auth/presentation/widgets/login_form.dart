import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../../core/widgets/phone_number_text_field.dart';
import '../../../../core/widgets/yaBalash_text_field.dart';
import '../blocs/cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final String phoneNumber;
  const LoginForm(
      {super.key, required this.formKey, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'رقم الهاتف',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 13.sp),
            ),
            mediumVerticalSpace,
            PhoneTextField(
              intialValue: phoneNumber,
              readOnly: true,
            ),
            mediumVerticalSpace,
            Text(
              'كلمة المرور',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 13.sp),
            ),
            mediumVerticalSpace,
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.obsecure != current.obsecure,
              builder: (context, state) {
                return YaBalashTextField(
                  name: 'password',
                  isWithBorder: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'كلمة السر مطلوبة')
                  ]),
                  onChanged: (value) {
                    if (value!.isEmpty) {
                      getIt<LoginCubit>().changeButtonDisabled(true);
                    } else {
                      getIt<LoginCubit>().changeButtonDisabled(false);
                    }
                  },
                  obsecure: state.obsecure,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(13),
                    child: InkWell(
                      onTap: () {
                        if (state.obsecure!) {
                          getIt<LoginCubit>().changeObsecure(false);
                        } else {
                          getIt<LoginCubit>().changeObsecure(true);
                        }
                      },
                      child: const CustomSvgIcon(
                        iconPath: AppAssets.eyeIcon,
                        color: Color(0xffBCBDBF),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
