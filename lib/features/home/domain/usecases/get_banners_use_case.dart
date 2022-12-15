import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/banner.dart';
import 'package:yabalash_mobile_app/features/home/domain/repositories/home_repository.dart';

class GetBannersUseCase implements UseCase<List<Banner>, NoParams> {
  final HomeRepository homeRepository;

  GetBannersUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<Banner>>> call(NoParams params) =>
      homeRepository.getBanners();
}
