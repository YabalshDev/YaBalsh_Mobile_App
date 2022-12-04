import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/home_product_card.dart';

import 'Title_row.dart';

class KewordSection extends StatelessWidget {
  final Section section;
  const KewordSection({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleRow(title: section.keyWord!),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            padding: kScaffoldPadding,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: section.products!.length,
            itemBuilder: (context, index) {
              final product = section.products![index];
              return HomeProductCard(product: product);
            },
          ),
        )
      ],
    );
  }
}
