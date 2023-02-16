import 'package:flutter/material.dart';

import '../widgets/recipie_details_body.dart';
import '../widgets/recipie_details_bottom.dart';

class RecipieDetailsView extends StatelessWidget {
  const RecipieDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RecipieDetailsBody(),
      bottomNavigationBar: RecipieDetailsBottom(),
    );
  }
}
