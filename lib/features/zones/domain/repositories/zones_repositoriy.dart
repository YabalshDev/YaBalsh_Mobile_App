import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/main_zone.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

import '../../../../core/errors/faliures.dart';

abstract class ZonesRepository {
  Future<Either<Failure, List<SubZone>>> getMainZoneSubZones(
      {required int mainZoneId});
  Future<Either<Failure, List<MainZone>>> getAllMainZones();
  void setZone({required SubZone zone});
  Future<Either<Failure, List<SubZone>>> getPastZones();
}
