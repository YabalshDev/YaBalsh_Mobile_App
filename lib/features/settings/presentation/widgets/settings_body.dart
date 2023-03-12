import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/utils/launch_url.dart';
import 'package:yabalash_mobile_app/features/settings/presentation/cubits/cubit/settings_cubit_cubit.dart';
import 'package:yabalash_mobile_app/features/settings/presentation/widgets/settings_element_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/services/user_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/show_support_dialog.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_header.dart';
import 'isNear_setting_card.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                        largeVerticalSpace,
                        getIt<AppSettingsService>().appConfig.appVersion !=
                                '2.0.0'
                            ? const SizedBox()
                            : SettingsElementCard(
                                onTap: () {
                                  Get.toNamed(RouteHelper.getPastOrdersRoute());
                                },
                                iconPath: AppAssets.ordersIcon,
                                title: 'طلباتي'),
                        getIt<AppSettingsService>().appConfig.appVersion !=
                                '2.0.0'
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
                            onTap: () {
                              showSupportDialog();
                            },
                            iconPath: AppAssets.headphoneIcon,
                            title: 'مركز المساعدة'),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        SettingsElementCard(
                            onTap: () {
                              launchCustomUrl(AppStrings.yabalashPageLink);
                            },
                            iconPath: AppAssets.speakerphoneIcon,
                            title: 'الشروط والاحكام'),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        SettingsElementCard(
                            onTap: () {
                              launchCustomUrl(AppStrings.yabalashPageLink);
                            },
                            iconPath: AppAssets.likeIcon,
                            title: 'تابعنا علي صفحاتنا'),
                      ],
                    ),
                    Container(
                      height: 10.h,
                      color: const Color(0xffF5F5F5),
                    ),
                    IsNearYouSettingCard(
                      iconPath: AppAssets.earthIcon,
                      title: 'القريب منك',
                      onSwitchTap: (value) {
                        BlocProvider.of<SettingsCubit>(context)
                            .handleIsNearSettingSwitchTap(value);
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
          ),
          Text(
            'نسخة ${AppStrings.appVersion}',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
          mediumVerticalSpace
        ],
      ),
    );
  }
}
