import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/recipies_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/sub_heading.dart';
import 'creator_card.dart';
import 'creators_loading.dart';

class CreatorsSection extends StatelessWidget {
  const CreatorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipiesCubit, RecipiesState>(
      builder: (context, state) {
        switch (state.creatorsRequestState) {
          case RequestState.idle:
            return const SizedBox();

          case RequestState.loading:
            return const CreatorsLoading();

          case RequestState.loaded:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeading(
                  text: 'وصفات من طهاة و ماركات',
                  isBold: false,
                ),
                mediumVerticalSpace,
                SizedBox(
                  height: 90.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.creators!.length,
                    itemBuilder: (context, index) {
                      final creator = state.creators![index];
                      return InkWell(
                        onTap: () => Get.toNamed(
                            RouteHelper.getCreatorDetailsRoute(),
                            arguments: creator),
                        child: CreatorCard(creator: creator),
                      );
                    },
                  ),
                )
              ],
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
