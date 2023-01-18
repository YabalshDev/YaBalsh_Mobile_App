import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';

import '../../../../core/constants/app_layouts.dart';
import 'shopping_list_header.dart';
import 'shopping_list_stores_section.dart';

class ShoppingListDetailsBody extends StatelessWidget {
  final ShoppingList shoppingList;

  const ShoppingListDetailsBody({super.key, required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShoppingListHeader(shoppingList: shoppingList),
              mediumVerticalSpace,
              const SubHeading(text: 'تفاصيل القائمة'),
              mediumVerticalSpace,
              const ShoppingListStoresSection()
            ],
          ),
        ),
      ),
    );
  }
}
