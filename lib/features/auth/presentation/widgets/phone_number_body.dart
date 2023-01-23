import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/constants/text_styles.dart';
import 'package:yabalash_mobile_app/core/widgets/phone_number_text_field.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/phone_number_cubit.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/auth_back_icon.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/auth_title_widget.dart';

final _formKey = GlobalKey<FormBuilderState>();

class PhoneNumberBody extends StatelessWidget {
  final String fromRoute;
  const PhoneNumberBody({super.key, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isVisible) {
      return SingleChildScrollView(
        reverse: isVisible ? true : false,
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const AuthBackIcon(),
              SizedBox(
                height: 180.h,
              ),
              const AuthTitleWidget(
                title: 'ايه هو رقم تليفونك ؟',
              ),
              mediumVerticalSpace,
              BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
                builder: (context, state) {
                  return FormBuilder(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ادخل رقم هاتفك للتحقق',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp),
                          ),
                          mediumVerticalSpace,
                          PhoneTextField(
                            hintText: '1012222222',
                            onChanged: (value) {
                              if (value!.isEmpty) {
                                BlocProvider.of<PhoneNumberCubit>(context)
                                    .changeButtonDisabled(true);
                              } else {
                                BlocProvider.of<PhoneNumberCubit>(context)
                                    .changeButtonDisabled(false);
                              }
                            },
                            isFilled: false,
                            readOnly: false,
                            hasError: state.formErrorMessage!.isNotEmpty,
                          ),
                          smallVerticalSpace,
                          state.formErrorMessage!.isNotEmpty
                              ? Text(
                                  state.formErrorMessage!,
                                  style: kErrorTextStyle,
                                )
                              : const SizedBox()
                        ],
                      ));
                },
              ),
              largeVerticalSpace,
              largeVerticalSpace,
              BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
                builder: (context, state) {
                  return YaBalashCustomButton(
                    isDisabled: state.isButtonDisabled,
                    child: const Text('متابعة'),
                    onTap: () async {
                      if (!state.isButtonDisabled!) {
                        final phoneNumber = _formKey.currentState!
                            .fields['phoneNumber']!.value as String;

                        BlocProvider.of<PhoneNumberCubit>(context)
                            .handlePhoneFormSubmission(
                                phoneNumber: phoneNumber, fromRoute: fromRoute);
                      }
                    },
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
    });
  }
}
