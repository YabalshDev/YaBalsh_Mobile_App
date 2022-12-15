import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';

import '../../../../core/errors/faliures.dart';
import '../../../../core/usecases/use_cases.dart';
import '../repositories/home_repository.dart';

class GetNearStoresUseCase implements UseCase<List<Store>, NoParams> {
  final HomeRepository homeRepository;

  GetNearStoresUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<Store>>> call(NoParams params) =>
      homeRepository.getNearStores();
}
