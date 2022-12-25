import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/widgets/shopping_list_header.dart';

import '../blocs/cubit/cubit/shopping_list_details_cubit.dart';

class ShoppingListDetailsView extends StatelessWidget {
  final ShoppingList shoppingList;
  const ShoppingListDetailsView({super.key, required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: kDefaultPadding,
          child: Column(
            children: [
              ShoppingListHeader(shoppingList: shoppingList),
              BlocBuilder<ShoppingListDetailsCubit, ShoppingListDetailsState>(
                builder: (context, state) {
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
