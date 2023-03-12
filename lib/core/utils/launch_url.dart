import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';

void launchCustomUrl(String url) async {
  final uri = Uri.parse(url);
  final canLaunch = await canLaunchUrl(uri);

  if (canLaunch) {
    launchUrl(uri);
  } else {
    yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        mainContent: 'الرابط غير متوفر',
        onConfirm: () => Get.back(),
        title: 'خطأ');
  }
}
