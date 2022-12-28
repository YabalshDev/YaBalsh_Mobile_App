import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';

import '../../../../core/errors/faliures.dart';
import '../../../../core/usecases/use_cases.dart';
import '../repositories/home_repository.dart';

class GetSectiosUseCase implements UseCase<List<Section>, GetSectiosParams> {
  final HomeRepository homeRepository;

  GetSectiosUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<Section>>> call(GetSectiosParams params) =>
      homeRepository.getHomeSections(keword: params.keword);
}

class GetSectiosParams extends Equatable {
  final String keword;

  const GetSectiosParams({required this.keword});
  @override
  List<Object?> get props => [keword];
}
