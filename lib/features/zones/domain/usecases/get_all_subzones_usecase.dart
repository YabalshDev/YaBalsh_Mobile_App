import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

import '../repositories/zones_repositoriy.dart';

class GetSubZonesUseCase implements UseCase<List<SubZone>, NoParams> {
  final ZonesRepository zonesRepository;

  GetSubZonesUseCase({required this.zonesRepository});

  @override
  Future<Either<Failure, List<SubZone>>> call(NoParams params) =>
      zonesRepository.getAllSubZones();
}
