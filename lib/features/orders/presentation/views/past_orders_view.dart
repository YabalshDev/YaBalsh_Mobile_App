import 'package:flutter/material.dart';

import '../widgets/past_orders_body.dart';

class PastOrdersView extends StatelessWidget {
  const PastOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PastOrdersBody());
  }
}
