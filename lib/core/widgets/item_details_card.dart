import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          // change to network when ready
          Expanded(
            flex: 1,
            child: Checkbox(
              value: isChecked,
              activeColor: Colors.green.shade400,
              onChanged: (value) => setState(() {
                isChecked = value!;
              }),
              side: const BorderSide(color: AppColorsLight.kDefaultBorderColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),

          Expanded(
            flex: 8,
            child: Row(
              children: [
                Opacity(
                  opacity: isChecked ? 0.6 : 1,
                  child: CustomCard(
                    withBorder: true,
                    isAssetImage: true,
                    imagePath: widget.cartItem.product!.imagePath,
                  ),
                ),
                mediumHorizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartItem.product!.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight,
                          fontSize: 13.sp,
                          decoration:
                              isChecked ? TextDecoration.lineThrough : null,
                          fontWeight: FontWeight.w600),
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
          ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${(widget.cartItem.quantity! * widget.cartItem.product!.prices!.entries.first.value.price!).toStringAsFixed(2)} جنيه',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18.sp,
                      decoration: isChecked ? TextDecoration.lineThrough : null,
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
  }
}
