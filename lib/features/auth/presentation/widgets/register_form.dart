import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_form_section.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../../core/widgets/phone_number_text_field.dart';
import '../blocs/cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final String phoneNumber;

  const RegisterForm(
      {super.key, required this.formKey, required this.phoneNumber});

  void validateOnChanged(String value) {
    if (value.isEmpty) {
      getIt<RegisterCubit>().changeButtonDisabled(true);
    }

    if (formKey.currentState!.fields['firstName']!.value != '' &&
        formKey.currentState!.fields['lastName']!.value != '' &&
        formKey.currentState!.fields['password']!.value != '') {
      getIt<RegisterCubit>().changeButtonDisabled(false);
    }
  }

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
          largeVerticalSpace,
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CustomFormSection(
                    title: Text(
                      'الاسم الاول',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 13.sp),
                    ),
                    name: 'firstName',
                    onChanged: (value) {
                      validateOnChanged(value!);
                    },
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
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 13.sp),
                    ),
                    name: 'lastName',
                    onChanged: (value) {
                      validateOnChanged(value!);
                    },
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
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 13.sp),
                ),
                Text(
                  '(إختياري)',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColorsLight.kTextFieldBorderColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp),
                ),
              ],
            ),
            name: 'email',
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.email(errorText: 'نسيت علامة @')]),
          ),
          mediumVerticalSpace,
          CustomFormSection(
            title: Text(
              'كلمة المرور',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 13.sp),
            ),
            name: 'password',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'كلمة السر مطلوبة'),
              FormBuilderValidators.minLength(8,
                  errorText: 'كلمة المرور لازم تكون أكثر من 8 حروف'),
            ]),
            obsecure: true,
            onChanged: (value) {
              validateOnChanged(value!);
            },
            suffixIcon: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(13),
                  child: InkWell(
                    onTap: () {
                      if (state.obsecure!) {
                        getIt<RegisterCubit>().changeObsecure(false);
                      } else {
                        getIt<RegisterCubit>().changeObsecure(true);
                      }
                    },
                    child: CustomSvgIcon(
                      iconPath: AppAssets.eyeIcon,
                      color: !state.formValidationError!
                          ? const Color(0xffBCBDBF)
                          : AppColorsLight.kErrorColor,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
