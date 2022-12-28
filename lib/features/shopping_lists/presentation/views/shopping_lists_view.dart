import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/widgets/shopping_list_body.dart';

class ShoppingListsView extends StatelessWidget {
  const ShoppingListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ShoppingListBody());
  }
}
