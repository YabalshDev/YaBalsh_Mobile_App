import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/main_zone.dart';

import '../repositories/zones_repositoriy.dart';

class GetMainZonesUseCase implements UseCase<List<MainZone>, NoParams> {
  final ZonesRepository zonesRepository;

  GetMainZonesUseCase({required this.zonesRepository});

  @override
  Future<Either<Failure, List<MainZone>>> call(NoParams params) =>
      zonesRepository.getAllMainZones();
}
