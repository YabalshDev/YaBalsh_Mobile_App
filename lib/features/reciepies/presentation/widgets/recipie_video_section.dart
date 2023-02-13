import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/yaBalash_toast.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import '../blocs/cubit/recipie_details_cubit.dart';
import 'recipie_video_card.dart';

class RecipieVideoSection extends StatelessWidget {
  const RecipieVideoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipieDetailsCubit, RecipieDetailsState>(
      listener: (context, state) {
        if (state.recipieRequestState == RequestState.error) {
          yaBalashCustomToast(message: state.errorMessage!, context: context);
        }
      },
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
