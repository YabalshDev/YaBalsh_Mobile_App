import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/super_market_search_card.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../blocs/other_branches_cubit.dart';
import '../widgets/other_branches_title.dart';

class OtherBranchesView extends StatelessWidget {
  const OtherBranchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OtherBranchesBody(),
    );
  }
}

class OtherBranchesBody extends StatelessWidget {
  const OtherBranchesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const OtherBranchTitle(), mediumVerticalSpace],
            )),
            const SliverFillRemaining(child: OtherBranchesSection())
          ],
        ),
      ),
    );
  }
}

class OtherBranchesSection extends StatelessWidget {
  const OtherBranchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherBranchesCubit, OtherBranchesState>(
      builder: (context, state) {
        switch (state.otherBranchesRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return state.otherBranches!.isEmpty
                ? SizedBox(
                    height: Get.height * 0.6,
                    child: const Center(
                        child: EmptyIndicator(
                      title: 'لا يوجد فروع اخرى',
                    )),
                  )
                : CustomAnimatedWidget(
                    child: ListView.builder(
                      itemCount: state.otherBranches!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final branch = state.otherBranches![index];
                        return SuperMarketSearchCard(store: branch);
                      },
                    ),
                  );
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: Center(
                  child: EmptyIndicator(
                title: state.errorMessage!,
              )),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
