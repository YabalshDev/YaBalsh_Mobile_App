import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../widgets/recipie_details_body.dart';

class RecipieDetailsView extends StatelessWidget {
  final Recipie recipie;
  const RecipieDetailsView({super.key, required this.recipie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipieDetailsBody(
        recipie: recipie,
      ),
    );
  }
}
