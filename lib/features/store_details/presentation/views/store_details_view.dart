import 'package:flutter/material.dart';

import '../widgets/store_details_body.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StoreDetailsBody(),
    );
  }
}
