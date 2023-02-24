import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/services/app_settings_service.dart';
import 'package:yabalash_mobile_app/features/settings/presentation/widgets/settings_element_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/user_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_header.dart';
import 'comparison_setting_card.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  bool isComparisonVersion = getIt<AppSettingsService>().appVersion == '1.0.0';
  bool isNearStoresActivated = getIt<AppSettingsService>().isNearStores;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeader(title: 'الاعدادات'),
                  mediumVerticalSpace,
                  Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Text(
                      'حسابي',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  largeVerticalSpace,
                  getIt<AppSettingsService>().appVersion == '1.0.0'
                      ? const SizedBox()
                      : SettingsElementCard(
                          onTap: () {
                            Get.toNamed(RouteHelper.getPastOrdersRoute());
                          },
                          iconPath: AppAssets.ordersIcon,
                          title: 'طلباتي'),
                  getIt<AppSettingsService>().appVersion == '1.0.0'
                      ? const SizedBox()
                      : Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                  SettingsElementCard(
                      onTap: () {
                        Get.toNamed(RouteHelper.getNotificationsRoute());
                      },
                      iconPath: AppAssets.notificationIcon,
                      title: 'الاشعارات'),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  SettingsElementCard(
                      onTap: () {
                        Get.toNamed(RouteHelper.getAddressesRoute(),
                            arguments: RouteHelper.getSettingsRoute());
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
              Container(
                height: 10.h,
                color: const Color(0xffF5F5F5),
              ),
              ComparisonSettingCard(
                activeIndicator:
                    getIt<AppSettingsService>().appVersion == '1.0.0',
                iconPath: AppAssets.settingsIcon,
                title: 'نسخة المقارنة',
                onSwitchTap: () {
                  if (isComparisonVersion) {
                    isComparisonVersion = false;
                    getIt<AppSettingsService>().setAppVersion('1.0.1');
                  } else {
                    isComparisonVersion = true;
                    getIt<AppSettingsService>().setAppVersion('1.0.0');
                  }
                  setState(() {});
                },
              ),
              ComparisonSettingCard(
                activeIndicator: isNearStoresActivated,
                iconPath: AppAssets.earthIcon,
                title: 'القريب منك',
                onSwitchTap: () {
                  if (isNearStoresActivated) {
                    isNearStoresActivated = false;
                    getIt<AppSettingsService>().setIsNearStores(false);
                  } else {
                    isNearStoresActivated = true;
                    getIt<AppSettingsService>().setIsNearStores(true);
                  }
                  setState(() {});
                },
              ),
              StatefulBuilder(
                builder: (context, setState) => SettingsElementCard(
                    onTap: () {
                      if (getIt<UserService>().token.isEmpty) {
                        Get.toNamed(RouteHelper.getPhoneNumberRoute(),
                            arguments: RouteHelper.getSettingsRoute());
                      } else {
                        yaBalashCustomDialog(
                          isWithEmoji: false,
                          buttonTitle: 'تاكيد',
                          title: 'ملاحظة',
                          mainContent: 'هل انت متاكد من تسجيل الخروج',
                          onConfirm: () {
                            getIt<UserService>().setToken('');
                            getIt<UserService>().logout();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
