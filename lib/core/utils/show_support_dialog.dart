import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/utils/launch_url.dart';

import '../widgets/custom_dialog.dart';

void showSupportDialog() {
  return yaBalashCustomDialog(
      buttonTitle: 'ابعتلنا رسالة',
      subContent:
          'احنا حابين نسمع منك أكتر ونساعدك ، ممكن تبعتلنا رسالة و فريق الدعم الفني هيتواصل معاك في أقرب وقت. ',
      isWithEmoji: true,
      onConfirm: () {
        Get.back();
        launchCustomUrl(AppStrings.supportLink);
      },
      title: 'هل لديك مشكلة في الحساب؟',
      mainContent: 'بنعتذر ليك جدا وبنشكرك علي تفهمك 💜');
}
