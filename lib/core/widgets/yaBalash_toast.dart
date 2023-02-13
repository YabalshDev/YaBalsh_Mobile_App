import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_toast.dart';

void yaBalashCustomToast(
    {required String message, required BuildContext context}) async {
  final toast = showToastWidget(CustomToast(message: message),
      animation: StyledToastAnimation.slideFromRight,
      reverseAnimation: StyledToastAnimation.slideToRight,
      isIgnoring: false,
      context: context,
      axis: Axis.horizontal,
      animDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 3),
      alignment: Alignment(5, Get.height - 20));

  if (toast.entry.mounted) {
    toast.entry.remove();
  }
}
