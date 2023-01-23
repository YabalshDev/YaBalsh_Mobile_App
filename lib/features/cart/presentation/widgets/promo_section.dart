import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/widgets/yaBalash_text_field.dart';

class PromoSection extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const PromoSection({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'كود التخفيض',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 17.sp),
        ),
        const Spacer(),
        Expanded(
            child: FormBuilder(
          key: formKey,
          child: YaBalashTextField(
            hintText: 'ادخل كود التخفيض..',
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.email(errorText: 'كود غير صالح')]),
          ),
        ))
      ],
    );
  }
}
