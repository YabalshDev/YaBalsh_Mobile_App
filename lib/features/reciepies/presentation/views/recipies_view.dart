import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../widgets/recipies_body.dart';

class RecipiesView extends StatelessWidget {
  final List<Recipie> recipies;
  const RecipiesView({super.key, required this.recipies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipiesBody(
        recipies: recipies,
      ),
    );
  }
}
