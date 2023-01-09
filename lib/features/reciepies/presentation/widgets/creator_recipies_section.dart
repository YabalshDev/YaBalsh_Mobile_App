import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/sub_heading.dart';
import 'reciepie_card.dart';

class CreatorRecipiesSection extends StatelessWidget {
  final List<Recipie> recipies;
  const CreatorRecipiesSection({super.key, required this.recipies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(text: 'جميع الوصفات'),
        smallVerticalSpace,
        ListView.builder(
          itemCount: recipies.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RecipieCard(
              recipie: recipies[index],
            );
          },
        )
      ],
    );
  }
}
