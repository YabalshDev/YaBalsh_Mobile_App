import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/settings/presentation/widgets/settings_element_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/user_service.dart';
import '../../../../core/widgets/custom_header.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeader(
                      isWithNotification: false, title: 'الاعدادات'),
                  largeVerticalSpace,
                  Text(
                    'حسابي',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.w700),
                  ),
                  largeVerticalSpace,
                  SettingsElementCard(
                      onTap: () {},
                      iconPath: AppAssets.ordersIcon,
                      title: 'طلباتي'),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  SettingsElementCard(
                      onTap: () {
                        Get.toNamed(RouteHelper.getAddressesRoute());
                      },
                      iconPath: AppAssets.addressesIcon,
                      title: 'عناويني'),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  SettingsElementCard(
                      onTap: () {},
                      iconPath: AppAssets.headphoneIcon,
                      title: 'مركز المساعدة'),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  SettingsElementCard(
                      onTap: () {},
                      iconPath: AppAssets.speakerphoneIcon,
                      title: 'الشروط والاحكام'),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  SettingsElementCard(
                      onTap: () {},
                      iconPath: AppAssets.likeIcon,
                      title: 'تابعنا علي صفحاتنا'),
                ],
              ),
            ),
            Container(
              height: 10.h,
              color: const Color(0xffF5F5F5),
            ),
            Padding(
                padding: kDefaultPadding,
                child: StatefulBuilder(
                  builder: (context, setState) => SettingsElementCard(
                      onTap: () {
                        if (getIt<UserService>().token.isEmpty) {
                          Get.toNamed(RouteHelper.getPhoneNumberRoute());
                        } else {
                          yaBalashCustomDialog(
                            isWithEmoji: false,
                            buttonTitle: 'تاكيد',
                            title: 'ملاحظة',
                            mainContent: 'هل انت متاكد من تسجيل الخروج',
                            onConfirm: () {
                              getIt<UserService>().setToken('');
                              setState(() {});
                              Get.back();
                            },
                          );
                        }
                      },
                      isWithTrailing: false,
                      titleColor: AppColorsLight.kAppPrimaryColorLight,
                      iconColor: AppColorsLight.kAppPrimaryColorLight,
                      iconPath: getIt<UserService>().token.isEmpty
                          ? AppAssets.loginIcon
                          : AppAssets.logoutIcon,
                      title: getIt<UserService>().token.isEmpty
                          ? 'تسجيل الدخول'
                          : 'تسجيل الخروج'),
                ))
          ],
        ),
      ),
    );
  }
}
