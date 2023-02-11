import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../../search/presentation/widgets/super_market_search_card.dart';
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

class OtherBranchesBody extends StatefulWidget {
  const OtherBranchesBody({super.key});

  @override
  State<OtherBranchesBody> createState() => _OtherBranchesBodyState();
}

class _OtherBranchesBodyState extends State<OtherBranchesBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        BlocProvider.of<OtherBranchesCubit>(context)
            .handleBranchesPagintation();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const OtherBranchTitle(), mediumVerticalSpace],
            )),
            const SliverToBoxAdapter(
              child: OtherBranchesSection(),
            ),
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
          case RequestState.loading:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.idle:
          case RequestState.loaded:
            return state.otherBranches!.isEmpty
                ? SizedBox(
                    height: Get.height * 0.6,
                    child: const Center(
                        child: EmptyIndicator(
                      title: 'لا يوجد فروع اخرى',
                    )),
                  )
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: state.otherBranches!.length * 85.h,
                        child: ListView.builder(
                          key: UniqueKey(),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.otherBranches!.length,
                          itemBuilder: (context, index) {
                            final branch = state.otherBranches![index];
                            return SuperMarketSearchCard(store: branch);
                          },
                        ),
                      ),
                      state.paginationLoading!
                          ? Positioned(
                              bottom: 2.h,
                              right: 0,
                              left: 0,
                              child: const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            )
                          : const Align(child: SizedBox())
                    ],
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
