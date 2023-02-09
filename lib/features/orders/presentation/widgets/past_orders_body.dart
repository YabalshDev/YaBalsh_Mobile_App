import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/blocs/cubit/past_orders_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_header.dart';
import 'past_order_loaded.dart';
import 'past_orders_loading.dart';

class PastOrdersBody extends StatefulWidget {
  const PastOrdersBody({super.key});

  @override
  State<PastOrdersBody> createState() => _PastOrdersBodyState();
}

class _PastOrdersBodyState extends State<PastOrdersBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        BlocProvider.of<PastOrdersCubit>(context).handlePastOrdersPagination();
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
              child: CustomHeader(
                iconPath: AppAssets.closeIcon,
                onIconTap: () => Get.back(),
                title: 'طلباتي',
              ),
            ),
            SliverToBoxAdapter(child: mediumVerticalSpace),
            const SliverToBoxAdapter(child: PastOrdersList())
          ],
        ),
      ),
    );
  }
}

class PastOrdersList extends StatelessWidget {
  const PastOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PastOrdersCubit, PastOrdersState>(
      builder: (context, state) {
        switch (state.ordersRequestState) {
          case RequestState.loading:
            return const PastOrdersLoading();

          case RequestState.idle:

          case RequestState.loaded:
            return const PastOrdersLoaded();
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: Center(child: EmptyIndicator(title: state.errorMessage!)),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
