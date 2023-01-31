import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/keyboard_dissmisable.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_form_section.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class ShoppingListBottomModal extends StatefulWidget {
  final VoidCallback onTap;
  final GlobalKey<FormBuilderState> formKey;
  const ShoppingListBottomModal(
      {super.key, required this.onTap, required this.formKey});

  @override
  State<ShoppingListBottomModal> createState() =>
      _ShoppingListBottomModalState();
}

class _ShoppingListBottomModalState extends State<ShoppingListBottomModal> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return KeyboardDissmisable(
      child: Padding(
        padding: kDefaultPadding,
        child: KeyboardVisibilityBuilder(builder: (context, isVisible) {
          return SizedBox(
              height: isVisible ? Get.height * 0.98 : Get.height * 0.4,
              child: SingleChildScrollView(
                reverse: isVisible,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 35.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColorsLight.kDisabledButtonTextColor,
                        ),
                      ),
                    ),
                    largeVerticalSpace,
                    Container(
                      padding: kDefaultPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'اسم القائمة',
                            style: Get.theme.textTheme.bodyLarge!.copyWith(
                                fontSize: 16.sp, fontWeight: FontWeight.w700),
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.close,
                              color: AppColorsLight.kAppPrimaryColorLight,
                            ),
                          )
                        ],
                      ),
                    ),
                    smallVerticalSpace,
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                    mediumVerticalSpace,
                    FormBuilder(
                      key: widget.formKey,
                      child: CustomFormSection(
                          onChanged: (value) {
                            setState(() {
                              if (value == null) {
                                name = '';
                              } else {
                                name = value;
                              }
                            });
                          },
                          title: Text(
                            'تغيير اسم القائمة',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp),
                          ),
                          name: 'name',
                          suffixIcon: name.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        name = '';
                                      });
                                      widget.formKey.currentState!.reset();
                                    },
                                    child: CustomSvgIcon(
                                        height: 14.h,
                                        iconPath: AppAssets.notAvailable),
                                  ),
                                )
                              : null),
                    ),
                    largeVerticalSpace,
                    YaBalashCustomButton(
                      isDisabled: name.isEmpty,
                      isSecondaryButton: false,
                      onTap: name.isNotEmpty ? widget.onTap : (() {}),
                      child: const Text('حفظ اسم القائمة'),
                    ),
                    SizedBox(
                      height: isVisible ? Get.height * 0.4 : 0,
                    )
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
