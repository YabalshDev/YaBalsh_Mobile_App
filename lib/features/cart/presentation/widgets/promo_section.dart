import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/yaBalash_text_field.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({super.key});

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
        const Expanded(
            child: YaBalashTextField(
          hintText: 'ادخل كود التخفيض..',
        ))
      ],
    );
  }
}
