import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliures.dart';
import '../../../../core/usecases/use_cases.dart';
import '../entities/home_section.dart';
import '../repositories/home_repository.dart';

class GetSectiosUseCase implements UseCase<List<HomeSection>, NoParams> {
  final HomeRepository homeRepository;

  GetSectiosUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<HomeSection>>> call(NoParams params) =>
      homeRepository.getHomeSections();
}
