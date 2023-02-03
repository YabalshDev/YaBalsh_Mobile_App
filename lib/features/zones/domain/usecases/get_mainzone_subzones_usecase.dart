import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

import '../repositories/zones_repositoriy.dart';

class GetMainZoneSubZonesUseCase
    implements UseCase<List<SubZone>, GetMainZoneSubZonesParams> {
  final ZonesRepository zonesRepository;

  GetMainZoneSubZonesUseCase({required this.zonesRepository});

  @override
  Future<Either<Failure, List<SubZone>>> call(
          GetMainZoneSubZonesParams params) =>
      zonesRepository.getMainZoneSubZones(mainZoneId: params.mainCategoryId);
}

class GetMainZoneSubZonesParams extends Equatable {
  final int mainCategoryId;

  const GetMainZoneSubZonesParams({required this.mainCategoryId});

  @override
  List<Object?> get props => [mainCategoryId];
}
