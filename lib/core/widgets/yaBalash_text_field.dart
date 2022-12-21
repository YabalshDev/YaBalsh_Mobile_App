import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/constants/text_styles.dart';

import '../theme/light/app_colors_light.dart';

class YaBalashTextField extends StatelessWidget {
  final Color? fillColor;
  final String? name;
  final bool? obsecure;
  final Widget? suffixIcon;
  final Color? errorColor;
  final bool? readOnly;
  final String? intialValue;
  final bool? isWithBorder;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hintText;

  const YaBalashTextField(
      {super.key,
      this.isWithBorder = true,
      this.hintText,
      this.validator,
      this.onChanged,
      this.fillColor = Colors.transparent,
      this.name = '',
      this.obsecure = false,
      this.suffixIcon,
      this.intialValue = '',
      this.errorColor = Colors.red,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      readOnly: readOnly ?? false,
      validator: validator,
      onChanged: onChanged ?? (value) {},
      name: name ?? '',
      initialValue: intialValue,
      obscureText: obsecure ?? false,
      cursorHeight: 25.h,
      cursorRadius: const Radius.circular(8),
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w600),
      cursorColor: AppColorsLight.kAppPrimaryColorLight,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12.sp, color: AppColorsLight.kTextFieldBorderColor),
        hintTextDirection: TextDirection.rtl,
        errorStyle: kErrorTextStyle,
        filled: fillColor != null ? true : false,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
            borderRadius: kDefaultBorderRaduis,
            borderSide: const BorderSide(
                width: 1.3, color: AppColorsLight.kErrorColor)),
        fillColor: fillColor,
        contentPadding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 10.w),
        enabledBorder: OutlineInputBorder(
            borderRadius: kDefaultBorderRaduis,
            borderSide: const BorderSide(
                width: 1.3, color: AppColorsLight.kTextFieldBorderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: kDefaultBorderRaduis,
            borderSide: const BorderSide(
                width: 1.3, color: AppColorsLight.kAppPrimaryColorLight)),
        border: !isWithBorder!
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: kDefaultBorderRaduis,
                borderSide: const BorderSide(
                    width: 1, color: AppColorsLight.kDisabledButtonTextColor)),
      ),
    );
  }
}
