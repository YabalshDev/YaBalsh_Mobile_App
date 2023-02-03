import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/cubit/product_details_cubit.dart';

class NearYouSection extends StatelessWidget {
  const NearYouSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              'القريب منك',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: state.withNearStores!
                      ? Colors.green.shade400
                      : Colors.grey.shade300),
            ),
            Platform.isAndroid
                ? Switch(
                    value: state.withNearStores!,
                    activeColor: Colors.green.shade400,
                    onChanged: (value) =>
                        BlocProvider.of<ProductDetailsCubit>(context)
                            .changeWithNearStores(value),
                  )
                : CupertinoSwitch(
                    value: state.withNearStores!,
                    activeColor: Colors.green.shade400,
                    onChanged: (value) =>
                        BlocProvider.of<ProductDetailsCubit>(context)
                            .changeWithNearStores(value),
                  )
          ],
        );
      },
    );
  }
}
