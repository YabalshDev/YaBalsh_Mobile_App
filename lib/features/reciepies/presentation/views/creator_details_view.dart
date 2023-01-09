import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/creator.dart';

import '../widgets/creator_details_body.dart';

class CreatorDetailsView extends StatelessWidget {
  final Creator creator;
  const CreatorDetailsView({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreatorDetailsBody(creator: creator),
    );
  }
}
