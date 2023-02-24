import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/widgets/shopping_list_details_body.dart';

import '../widgets/shopping_list_details_bottom.dart';

class ShoppingListDetailsView extends StatelessWidget {
  final ShoppingList shoppingList;
  const ShoppingListDetailsView({super.key, required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingListDetailsBody(
        shoppingList: shoppingList,
      ),
      bottomNavigationBar: const ShoppingListDetailsBottom(),
    );
  }
}
