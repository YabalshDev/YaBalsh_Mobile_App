import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_header.dart';
import '../blocs/cubit/store_details_cubit.dart';

class BranchTitle extends StatelessWidget {
  const BranchTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
      builder: (context, state) {
        return CustomHeader(
            iconPath: AppAssets.backIcon,
            title:
                '${state.store!.name} - ${state.store!.location!.address!.split('-')[1]}');
      },
    );
  }
}
