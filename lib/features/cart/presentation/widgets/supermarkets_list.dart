import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cubit/super_markets_cubit.dart';

class SuperMarketLists extends StatelessWidget {
  const SuperMarketLists({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperMarketsCubit, SuperMarketsState>(
      builder: (context, state) {
        return Column(
          children: const [
            Center(
              child: Text('السوبرماركتس'),
            )
          ],
        );
      },
    );
  }
}
