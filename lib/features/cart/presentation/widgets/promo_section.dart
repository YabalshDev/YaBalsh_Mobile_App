import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

import '../../../../core/widgets/yaBalash_text_field.dart';
import '../blocs/cubit/order_summary_cubit.dart';

class PromoSection extends StatefulWidget {
  const PromoSection({
    super.key,
  });

  @override
  State<PromoSection> createState() => _PromoSectionState();
}

class _PromoSectionState extends State<PromoSection> {
  late GlobalKey<FormBuilderState> formKey;
  @override
  void initState() {
    formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
              child: BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: !state.isPromoValid!
                            ? Border.all(color: AppColorsLight.kErrorColor)
                            : Border.all(
                                color: AppColorsLight.kDisabledButtonTextColor,
                                width: 1)),
                    child: YaBalashTextField(
                      name: 'promo',
                      hintText: 'ادخل كود التخفيض..',
                      isWithBorder: false,
                      onChanged: (value) {
                        if (value != null && value.isEmpty) {
                          BlocProvider.of<OrderSummaryCubit>(context)
                              .changePromoValidation(true);
                        } else {
                          BlocProvider.of<OrderSummaryCubit>(context)
                              .changePromoValidation(false);
                        }
                      },
                    ),
                  );
                },
              ),
            ))
          ],
        ),
        smallVerticalSpace,
        BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
          builder: (context, state) {
            return state.isPromoValid!
                ? const SizedBox()
                : Text(
                    'كود التخفيض ساري بس علي الطلبات الي يابلاش بيوصلها ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColorsLight.kErrorColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600),
                  );
          },
        )
      ],
    );
  }
}
