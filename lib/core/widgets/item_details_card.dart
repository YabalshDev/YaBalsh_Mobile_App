import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/utils/extensions/string_extension.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/cart_item.dart';

import '../constants/app_layouts.dart';
import '../theme/light/app_colors_light.dart';
import 'custom_card.dart';

class ItemDetailsCard extends StatefulWidget {
  final CartItem cartItem;
  const ItemDetailsCard({super.key, required this.cartItem});

  @override
  State<ItemDetailsCard> createState() => _ItemDetailsCardState();
}

class _ItemDetailsCardState extends State<ItemDetailsCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.only(top: 10.h),
        child: Row(
          children: [
            InkWell(
              onTap: () => setState(() {
                isChecked = !isChecked;
              }),
              child: Container(
                width: 25.h,
                height: 25.h,
                decoration: BoxDecoration(
                    borderRadius: kSecondaryBorderRaduis,
                    color: !isChecked ? Colors.white : Colors.green.shade400,
                    border: Border.all(
                        color: AppColorsLight.kDefaultBorderColor, width: 1)),
                child: isChecked
                    ? Icon(
                        Icons.check,
                        size: 22.h,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            smallHorizontalSpace,
            Row(
              children: [
                Opacity(
                  opacity: isChecked ? 0.6 : 1,
                  child: CustomCard(
                    withBorder: true,
                    isAssetImage: false,
                    imagePath: widget.cartItem.product!.imagePath,
                    width: 53.w,
                    height: 53.h,
                  ),
                ),
                mediumHorizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: constraints.maxWidth * 0.42),
                      child: Text(
                        widget.cartItem.product!.name!.split('-')[0].arabicText,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColorsLight.kAppPrimaryColorLight,
                            fontSize: 13.sp,
                            decoration:
                                isChecked ? TextDecoration.lineThrough : null,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    mediumVerticalSpace,
                    Text(
                      widget.cartItem.product!.size ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 9.sp,
                          decoration:
                              isChecked ? TextDecoration.lineThrough : null,
                          color: AppColorsLight.kAppPrimaryColorLight,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: constraints.maxWidth * 0.31,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${(widget.cartItem.quantity! * widget.cartItem.product!.prices!.entries.first.value.price!).toStringAsFixed(2)} جنيه',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18.sp,
                        decoration:
                            isChecked ? TextDecoration.lineThrough : null,
                        color: AppColorsLight.kAppPrimaryColorLight),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '${widget.cartItem.quantity}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              decoration:
                                  isChecked ? TextDecoration.lineThrough : null,
                              color: AppColorsLight.kAppPrimaryColorLight
                                  .withOpacity(0.7),
                            ),
                      ),
                      Text(
                        ' x ',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              decoration:
                                  isChecked ? TextDecoration.lineThrough : null,
                              color: AppColorsLight.kAppPrimaryColorLight
                                  .withOpacity(0.7),
                            ),
                      ),
                      Text(
                        ' ${widget.cartItem.product!.prices!.entries.first.value.price!.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              decoration:
                                  isChecked ? TextDecoration.lineThrough : null,
                              color: AppColorsLight.kAppPrimaryColorLight
                                  .withOpacity(0.7),
                            ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
