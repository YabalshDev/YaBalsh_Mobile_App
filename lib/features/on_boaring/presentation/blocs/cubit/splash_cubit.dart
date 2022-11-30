import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:yabalash_mobile_app/routes/app_routes.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void splashInit() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => Get.toNamed(RouteHelper.getOnBoardingRoute()),
    );
  }
}
