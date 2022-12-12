import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/phone_number_text_field.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/blocs/cubit/phone_number_cubit.dart';

import '../../../../core/theme/light/app_colors_light.dart';

class PhoneNumberBody extends StatelessWidget {
  const PhoneNumberBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            const Icon(
              Icons.arrow_back_ios,
              color: AppColorsLight.kAppPrimaryColorLight,
            ),
            SizedBox(
              height: 180.h,
            ),
            Text(
              'ايه هو رقم تليفونك ؟',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
            ),
            mediumVerticalSpace,
            Text(
              'ادخل رقم هاتفك للتحقق',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 13.sp),
            ),
            mediumVerticalSpace,
            PhoneTextField(
              hintText: '1012222222',
              onChanged: (value) {
                if (value!.isEmpty) {
                  Get.find<PhoneNumberCubit>().changeButtonDisabled(true);
                } else {
                  Get.find<PhoneNumberCubit>().changeButtonDisabled(false);
                }
              },
              isFilled: false,
              readOnly: false,
            ),
            largeVerticalSpace,
            largeVerticalSpace,
            BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
              builder: (context, state) {
                return YaBalashCustomButton(
                  isDisabled: state.isButtonDisabled,
                  child: const Text('متابعة'),
                  onTap: () {},
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
