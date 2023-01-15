import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';

import '../widgets/creator_details_body.dart';

class CreatorDetailsView extends StatelessWidget {
  final Brand brand;
  const CreatorDetailsView({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreatorDetailsBody(brand: brand),
    );
  }
}
