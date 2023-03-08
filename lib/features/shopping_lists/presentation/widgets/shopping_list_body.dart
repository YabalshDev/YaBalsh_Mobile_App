import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/widgets/recipies_section.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/widgets/shopping_list_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/empty_states.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_header.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../../../../core/widgets/yaBalash_toast.dart';
import '../blocs/cubit/shopping_list_cubit.dart';

class ShoppingListBody extends StatelessWidget {
  const ShoppingListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: const CustomScrollView(slivers: [
          SliverToBoxAdapter(child: CustomHeader(title: 'قوائمي')),
          SliverToBoxAdapter(child: ShoppingListsSection()),
          SliverToBoxAdapter(child: RecipiesSection())
        ]),
      ),
    );
  }
}

class ShoppingListsSection extends StatelessWidget {
  const ShoppingListsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingListCubit, ShoppingListState>(
      listener: (context, state) {
        if (state.shoppingListRequestState == RequestState.error) {
          yaBalashCustomToast(message: state.errorMessage!, context: context);
        }
      },
      buildWhen: (previous, current) =>
          previous.shoppingListRequestState != current.shoppingListRequestState,
      builder: (context, state) {
        switch (state.shoppingListRequestState) {
          case RequestState.loading:
            return SizedBox(
              height: Get.height * 0.65,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );

          case RequestState.idle:

          case RequestState.loaded:
            return state.shoppingLists!.isEmpty
                ? SizedBox(
                    height: Get.height * 0.5,
                    child: const Center(
                        child: EmptyIndicator(
                            emptyStateType: EmptyStates.other,
                            title: 'لا يوجد قوائم مختارة')),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        padding: kDefaultPadding,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.shoppingLists!.length,
                        itemBuilder: (context, index) {
                          final shoppingList = state.shoppingLists![index];
                          return ShoppingListCard(shoppingList: shoppingList);
                        },
                      ),
                      mediumVerticalSpace,
                    ],
                  );
          case RequestState.error:
            return Center(
                child: ErrorIndicator(errorMessage: state.errorMessage!));

          default:
            return const SizedBox();
        }
      },
    );
  }
}
