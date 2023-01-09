import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../home/presentation/widgets/Title_row.dart';
import '../blocs/cubit/shopping_list_cubit.dart';
import 'recipie_shopping_list_card.dart';

class RecipiesLoaded extends StatelessWidget {
  final ShoppingListState state;
  const RecipiesLoaded({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleRow(
          title: 'طبختك علي اد ايدك !',
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          fontWeight: FontWeight.w700,
          onSelectAll: () => Get.toNamed(RouteHelper.getRecipiesRoute(),
              arguments: state.recipies),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'اختار الوصفة, مقادير باقل الاسعار',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: AppColorsLight.kAppPrimaryColorLight),
          ),
        ),
        mediumVerticalSpace,
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            itemCount: state.recipies!.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            key: UniqueKey(),
            itemBuilder: (context, index) {
              final recipie = state.recipies![index];
              return RecipieShoppingListCard(
                recipie: recipie,
              );
            },
          ),
        )
      ],
    );
  }
}
