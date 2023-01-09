import 'package:flutter/material.dart';

import '../../domain/entities/creator.dart';
import 'creator_card.dart';

class CreatorDetailsSection extends StatelessWidget {
  final Creator creator;
  const CreatorDetailsSection({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CreatorCard(
      creator: creator,
    ));
  }
}
