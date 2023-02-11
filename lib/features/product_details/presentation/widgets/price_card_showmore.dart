import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../blocs/cubit/product_details_cubit.dart';

class PriceCardShowMore extends StatelessWidget {
  const PriceCardShowMore({
    Key? key,
    required this.pricesLength,
  }) : super(key: key);

  final int pricesLength;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return pricesLength <= 5
            ? const SizedBox()
            : pricesLength > 5 && state.showMore!
                ? InkWell(
                    onTap: () => BlocProvider.of<ProductDetailsCubit>(context)
                        .changeShowMore(false),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'عرض كل الاسعار',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColorsLight.kAppPrimaryColorLight,
                                  fontWeight: FontWeight.w700),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColorsLight.kAppPrimaryColorLight,
                        )
                      ],
                    ),
                  )
                : pricesLength > 5 && !state.showMore!
                    ? InkWell(
                        onTap: () =>
                            BlocProvider.of<ProductDetailsCubit>(context)
                                .changeShowMore(true),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'عرض اسعار اقل',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color:
                                          AppColorsLight.kAppPrimaryColorLight,
                                      fontWeight: FontWeight.w700),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_up,
                              color: AppColorsLight.kAppPrimaryColorLight,
                            )
                          ],
                        ),
                      )
                    : const SizedBox();
      },
    );
  }
}
