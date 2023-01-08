import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/repositories/recipies_repository.dart';

class GetRecipieDetailsUseCase
    implements UseCase<Recipie, GetRecipieDetailsParams> {
  final RecipiesRepository recipiesRepository;

  GetRecipieDetailsUseCase({required this.recipiesRepository});
  @override
  Future<Either<Failure, Recipie>> call(GetRecipieDetailsParams params) =>
      recipiesRepository.getRecipieById(id: params.id);
}

class GetRecipieDetailsParams extends Equatable {
  final String id;

  const GetRecipieDetailsParams({required this.id});

  @override
  List<Object?> get props => [id];
}
