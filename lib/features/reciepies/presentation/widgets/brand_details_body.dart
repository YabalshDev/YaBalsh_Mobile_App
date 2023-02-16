import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/brands_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_header.dart';
import '../../domain/entities/brand.dart';
import 'brand_details_section.dart';
import 'brand_recipies_section.dart';

class BrandDetailsBody extends StatefulWidget {
  const BrandDetailsBody({
    super.key,
  });

  @override
  State<BrandDetailsBody> createState() => _BrandDetailsBodyState();
}

class _BrandDetailsBodyState extends State<BrandDetailsBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        BlocProvider.of<BrandsCubit>(context).handleRecipiesPagination();
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
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(
                    title: 'وصفات ${(Get.routing.args as Brand).name}',
                    iconPath: AppAssets.backIcon,
                  ),
                  largeVerticalSpace,
                  const CreatorDetailsSection(),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: CreatorRecipiesSection())
          ],
        ),
      ),
    );
  }
}
