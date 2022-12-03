import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/sections_mock_list.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/home_product_card.dart';

import 'Title_row.dart';

class KewordSection extends StatelessWidget {
  const KewordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleRow(title: sectionsMock[0].keyWord!),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            padding: kScaffoldPadding,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: sectionsMock[0].products!.length,
            itemBuilder: (context, index) {
              final product = sectionsMock[0].products![index];
              return HomeProductCard(product: product);
            },
          ),
        )
      ],
    );
  }
}
