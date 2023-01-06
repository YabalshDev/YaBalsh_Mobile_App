import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/recipie_video_card.dart';

import 'creator_details_widget.dart';

class RecipieDetailsBody extends StatelessWidget {
  const RecipieDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RecipieVideoCard(),
          smallVerticalSpace,
          Padding(
            padding: kDefaultPadding,
            child: const SubHeading(text: 'تفاصيل الوصفة'),
          ),
          const CreatorDetailsWidget()
        ],
      ),
    );
  }
}
