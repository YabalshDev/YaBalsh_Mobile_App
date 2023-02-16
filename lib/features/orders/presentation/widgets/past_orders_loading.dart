import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PastOrdersLoading extends StatelessWidget {
  const PastOrdersLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.65,
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
