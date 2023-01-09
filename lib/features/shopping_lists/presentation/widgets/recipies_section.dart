import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/shopping_list_cubit.dart';

import '../../../../core/utils/enums/request_state.dart';
import 'recipies_loaded.dart';
import 'recipies_loading.dart';

class RecipiesSection extends StatelessWidget {
  const RecipiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListState>(
      builder: (context, state) {
        switch (state.recipiesRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const RecipiesLoading();
          case RequestState.loaded:
            return state.recipies!.isEmpty
                ? const SizedBox()
                : RecipiesLoaded(
                    state: state,
                  );

          case RequestState.error:
            return const SizedBox();

          default:
            return const SizedBox();
        }
      },
    );
  }
}
