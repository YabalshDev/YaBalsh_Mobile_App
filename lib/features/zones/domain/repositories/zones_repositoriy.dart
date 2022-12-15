import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';

import '../../../../core/errors/faliures.dart';

abstract class ZonesRepository {
  Future<Either<Failure, List<SubZone>>> getAllSubZones();
  void setZone({required SubZone zone});
  Either<Failure, List<SubZone>> getPastZones();
}
