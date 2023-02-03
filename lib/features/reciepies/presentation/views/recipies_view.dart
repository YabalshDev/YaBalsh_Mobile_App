import 'package:flutter/material.dart';

import '../widgets/recipies_body.dart';

class RecipiesView extends StatelessWidget {
  const RecipiesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RecipiesBody(),
    );
  }
}
