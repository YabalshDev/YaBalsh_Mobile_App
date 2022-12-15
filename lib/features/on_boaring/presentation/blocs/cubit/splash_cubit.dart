import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/on_boaring/domain/repositories/splash_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepository splashRepository;

  SplashCubit({required this.splashRepository}) : super(SplashInitial());

  bool _isFirstTimeVisit = true;
  bool get isFirstTimeVisit => _isFirstTimeVisit;

  void checkIsFirstTimeVisit() {
    final response = splashRepository.checkIsFirstTimeVisit();
    response.fold((failure) {}, (result) => _isFirstTimeVisit = result);
  }

  void setIsFirstTimeVisit(bool value) {
    final response = splashRepository.setIsFirstTimeVisit(value: value);

    response.fold((l) {}, (result) {
      print('success');
    });
  }

  void splashInit() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        checkIsFirstTimeVisit();

        if (_isFirstTimeVisit) {
          setIsFirstTimeVisit(false);
          Get.offAndToNamed(RouteHelper.getOnBoardingRoute());
        } else {
          Get.offAndToNamed(
            RouteHelper.getMainNavigationRoute(),
          );
        }
      },
    );
  }
}
