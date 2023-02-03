import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';

import '../../../../core/widgets/custom_header.dart';
import '../blocs/other_branches_cubit.dart';

class OtherBranchTitle extends StatelessWidget {
  const OtherBranchTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherBranchesCubit, OtherBranchesState>(
      builder: (context, state) {
        return CustomHeader(
            iconPath: AppAssets.backIcon,
            title: '${state.currentStore!.name} - فروع اخرى');
      },
    );
  }
}
