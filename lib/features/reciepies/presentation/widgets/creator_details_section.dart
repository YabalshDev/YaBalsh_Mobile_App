import 'package:flutter/material.dart';

import '../../domain/entities/brand.dart';
import 'creator_card.dart';

class CreatorDetailsSection extends StatelessWidget {
  final Brand brand;
  const CreatorDetailsSection({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CreatorCard(
      brand: brand,
    ));
  }
}
