import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/recipie_products_section.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/recipie_video_card.dart';

import '../../domain/entities/recipie.dart';
import 'creator_details_widget.dart';
import 'recipie_details_section.dart';

class RecipieDetailsBody extends StatelessWidget {
  final Recipie recipie;
  const RecipieDetailsBody({super.key, required this.recipie});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipieVideoCard(
            recipie: recipie,
          ),
          smallVerticalSpace,
          Padding(
            padding: kDefaultPadding,
            child: const SubHeading(text: 'تفاصيل الوصفة'),
          ),
          CreatorDetailsWidget(
            recipie: recipie,
          ),
          smallVerticalSpace,
          RecipieDetailsSection(
            recipie: recipie,
          ),
          RecipieProductsSection(
            products: recipie.products!,
          )
        ],
      ),
    );
  }
}
