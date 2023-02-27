import 'package:get/get.dart';

import '../routes/app_routes.dart';
import 'custom_dialog.dart';

void showNotLoggedInDialog() {
  return yaBalashCustomDialog(
    isWithEmoji: false,
    buttonTitle: 'تسجيل/مستخدم جديد',
    mainContent: 'انت لست مسجلا سجل دخول لتتمكن من اتمام العملية.',
    title: 'ملاحظة',
    onConfirm: () => Get
      ..back()
      ..offNamed(RouteHelper.getPhoneNumberRoute(),
          arguments: RouteHelper.getCartRoute()),
  );
}
