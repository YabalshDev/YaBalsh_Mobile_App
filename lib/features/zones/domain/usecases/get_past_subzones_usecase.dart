import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

import '../repositories/zones_repositoriy.dart';

class GetPastSubZonesUseCase
    implements SynchornousUseCase<List<SubZone>, NoParams> {
  final ZonesRepository zonesRepository;

  GetPastSubZonesUseCase({required this.zonesRepository});

  @override
  Either<Failure, List<SubZone>> call(NoParams params) =>
      zonesRepository.getPastZones();
}
