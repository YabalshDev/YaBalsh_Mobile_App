// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/api/local_data_api/local_storage_provider.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/features/on_boaring/domain/repositories/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final LocalStorageProvider localStorageProvider;

  SplashRepositoryImpl({required this.localStorageProvider});
  @override
  Either<Failure, bool> checkIsFirstTimeVisit() {
    try {
      bool isFirstTimeVisit = true;
      final response = localStorageProvider.getData(
          key: AppStrings.isFirstTimeVisitKey) as bool?;

      if (response != null) {
        isFirstTimeVisit = false;
      }

      return Right(isFirstTimeVisit);
    } catch (err) {
      return const Left(CacheFailure(message: 'couldn`t fetch from cache'));
    }
  }

  @override
  Either<Failure, void> setIsFirstTimeVisit({required bool value}) {
    try {
      final response = localStorageProvider.setData(
          key: AppStrings.isFirstTimeVisitKey, data: value) as bool?;

      return Right(response);
    } catch (err) {
      return const Left(CacheFailure(message: 'couldn`t fetch from cache'));
    }
  }
}
