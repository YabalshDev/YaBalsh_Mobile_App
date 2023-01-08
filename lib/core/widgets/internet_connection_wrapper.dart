import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/cubits/cubit/connectivty_cubit.dart';

import 'no_internet_view.dart';

class InternetConnectionWrapper extends StatelessWidget {
  final Widget child;
  const InternetConnectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivtyCubit, ConnectivtyState>(
      builder: (context, state) {
        if (!state.isConnected!) {
          return const NoInternetView();
        } else {
          return child;
        }
      },
    );
  }
}
