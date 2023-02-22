import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/utils/map_utils.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../blocs/cubit/store_details_cubit.dart';

class BranchMapImage extends StatelessWidget {
  const BranchMapImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
      builder: (context, state) {
        return AspectRatio(
          aspectRatio: 345.h / 179.w,
          child: InkWell(
            onTap: () => MapUtils.navigateToMap(state.store!.location!.lat!,
                state.store!.location!.lat!, state.store!.name!),
            child: ClipRRect(
              borderRadius: kDefaultBorderRaduis,
              child: AppImage(
                path: state.store!.location!.mapImage!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
