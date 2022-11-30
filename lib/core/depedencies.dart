import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/on_boaring/presentation/blocs/cubit/splash_cubit.dart';

import '../features/on_boaring/presentation/blocs/cubit/on_boarding_cubit.dart';

setupDependecies() {
  Get.lazyPut(() => OnBoardingCubit(), fenix: true);
  Get.lazyPut(() => SplashCubit(), fenix: true);
}
