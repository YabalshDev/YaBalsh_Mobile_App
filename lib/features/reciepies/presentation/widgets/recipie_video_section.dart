import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../blocs/cubit/recipie_details_cubit.dart';
import 'recipie_video_card.dart';

class RecipieVideoSection extends StatelessWidget {
  const RecipieVideoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipieDetailsCubit, RecipieDetailsState>(
      builder: (context, state) {
        switch (state.recipieRequestState) {
          case RequestState.idle:
            return const SizedBox();

          case RequestState.loading:
            return CustomShimmer(
              height: 100.h,
              width: Get.width,
            );
          case RequestState.loaded:
            return state.recipie!.videoLink != null
                ? RecipieVideoCard(
                    recipie: state.recipie!,
                  )
                : const SizedBox();

          case RequestState.error:
            return const SizedBox();

          default:
            return const SizedBox();
        }
      },
    );
  }
}
