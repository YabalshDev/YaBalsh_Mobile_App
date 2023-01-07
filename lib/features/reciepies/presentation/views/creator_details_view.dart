import 'package:flutter/material.dart';

import '../widgets/creator_details_body.dart';

class CreatorDetailsView extends StatelessWidget {
  const CreatorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreatorDetailsBody(),
    );
  }
}
