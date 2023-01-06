import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/recipie_video_card.dart';

class RecipieDetailsBody extends StatelessWidget {
  const RecipieDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [RecipieVideoCard()],
    );
  }
}
