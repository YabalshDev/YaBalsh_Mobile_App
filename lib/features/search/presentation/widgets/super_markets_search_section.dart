import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperMarketsSearchSection extends StatelessWidget {
  const SuperMarketsSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height * 0.6,
        child: const Center(
          child: Text('سوبر ماركتس'),
        ),
      ),
    );
  }
}
