import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';

import '../../../../core/widgets/custom_header.dart';
import '../widgets/past_orders_body.dart';

class PastOrdersView extends StatelessWidget {
  const PastOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PastOrdersBody());
  }
}
