import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/recipies_cubit.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/all_recipies_section.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/widgets/brands_section.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/custom_header.dart';

class RecipiesBody extends StatefulWidget {
  const RecipiesBody({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipiesBody> createState() => _RecipiesBodyState();
}

class _RecipiesBodyState extends State<RecipiesBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        BlocProvider.of<RecipiesCubit>(context).handlePagination('recpies');
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
        child: CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                title: 'قوائم الوصفات',
                iconPath: AppAssets.closeIcon,
                onIconTap: () => Get.offNamed(
                    RouteHelper.getMainNavigationRoute(),
                    arguments: 3),
              ),
              mediumVerticalSpace,
              const BrandsSection(),
              smallVerticalSpace
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: AllRecipiesSection(),
        )
      ],
    ));
  }
}
