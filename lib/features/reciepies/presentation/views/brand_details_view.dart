import 'package:flutter/material.dart';

import '../widgets/brand_details_body.dart';

class BrandDetailsView extends StatelessWidget {
  const BrandDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BrandDetailsBody(),
    );
  }
}
