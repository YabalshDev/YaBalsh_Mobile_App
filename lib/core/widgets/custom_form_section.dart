import 'package:flutter/material.dart';

import '../constants/app_layouts.dart';
import 'yaBalash_text_field.dart';

class CustomFormSection extends StatelessWidget {
  final Widget? title;
  final String? intialValue;
  final String? name;
  final bool? obsecure;
  final bool? readOnly;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final Color? fillColor;
  final VoidCallback? onTap;

  const CustomFormSection(
      {super.key,
      this.title,
      this.fillColor = Colors.transparent,
      this.intialValue,
      this.onTap,
      this.suffixIcon,
      this.name,
      this.obsecure,
      this.readOnly,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      title ?? const SizedBox(),
      mediumVerticalSpace,
      YaBalashTextField(
        name: name,
        onTap: onTap,
        fillColor: fillColor,
        onChanged: onChanged,
        validator: validator,
        obsecure: obsecure,
        readOnly: readOnly,
        intialValue: intialValue,
        suffixIcon: suffixIcon,
      )
    ]);
  }
}
