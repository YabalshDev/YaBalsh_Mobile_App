import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/widgets/recipies_section.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/widgets/shopping_list_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_header.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../blocs/cubit/shopping_list_cubit.dart';

class ShoppingListBody extends StatelessWidget {
  const ShoppingListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(isWithNotification: false, title: 'قوائمي'),
              BlocBuilder<ShoppingListCubit, ShoppingListState>(
                builder: (context, state) {
                  switch (state.shoppingListRequestState) {
                    case RequestState.idle:
                      return const SizedBox();

                    case RequestState.loading:
                      return SizedBox(
                        height: Get.height * 0.65,
                        child: const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );

                    case RequestState.loaded:
                      return state.shoppingLists!.isEmpty
                          ? SizedBox(
                              height: Get.height * 0.6,
                              child: const Center(
                                  child: EmptyIndicator(
                                      title: 'لا يوجد قوائم مختارة')),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  padding: kDefaultPadding,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.shoppingLists!.length,
                                  itemBuilder: (context, index) {
                                    final shoppingList =
                                        state.shoppingLists![index];
                                    return ShoppingListCard(
                                        shoppingList: shoppingList);
                                  },
                                ),
                                mediumVerticalSpace,
                                const RecipiesSection()
                              ],
                            );
                    case RequestState.error:
                      return EmptyIndicator(title: state.errorMessage!);

                    default:
                      return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
