import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';

abstract class SplashRepository {
  Either<Failure, bool> checkIsFirstTimeVisit();
  Either<Failure, void> setIsFirstTimeVisit({required bool value});
}
