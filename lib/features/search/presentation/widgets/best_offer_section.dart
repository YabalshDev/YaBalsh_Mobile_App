import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../../../home/presentation/widgets/main_product_card.dart';
import '../blocs/cubit/search_cubit.dart';

class BestOfferSection extends StatelessWidget {
  const BestOfferSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          previous.chepeastProduct != current.chepeastProduct,
      builder: (context, state) {
        return state.chepeastProduct!.id != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubHeading(text: 'افضل عرض على ${state.intialValue}'),
                  mediumVerticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: MainProductCard(
                        product: state.chepeastProduct!, fromSearch: true),
                  ),
                  mediumVerticalSpace
                ],
              )
            : const SizedBox();
      },
    );
  }
}
