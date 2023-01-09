import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';

import '../../domain/entities/recipie.dart';
import 'reciepie_card.dart';

class AllRecipiesSection extends StatelessWidget {
  final List<Recipie> recipies;
  const AllRecipiesSection({super.key, required this.recipies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeading(text: 'طبختك علي قد ايدك!'),
        smallVerticalSpace,
        ListView.builder(
          itemCount: recipies.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final recipie = recipies[index];
            return RecipieCard(
              recipie: recipie,
            );
          },
        )
      ],
    );
  }
}
