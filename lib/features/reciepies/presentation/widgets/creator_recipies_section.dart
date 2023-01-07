import 'package:flutter/material.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/sub_heading.dart';
import 'reciepie_card.dart';

class CreatorRecipiesSection extends StatelessWidget {
  const CreatorRecipiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(text: 'جميع الوصفات'),
        smallVerticalSpace,
        ListView.builder(
          itemCount: 9,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const RecipieCard();
          },
        )
      ],
    );
  }
}
