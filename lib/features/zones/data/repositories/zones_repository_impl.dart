import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/zones/data/datasources/zone_local_data_source.dart';
import 'package:yabalash_mobile_app/features/zones/data/datasources/zone_remote_data_source.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/main_zone.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/zones/domain/repositories/zones_repositoriy.dart';

class ZonesRepositoryImpl implements ZonesRepository {
  final ZonesLocalDataSource zonesLocalDataSource;
  final ZonesRemoteDataSource zonesRemoteDataSource;

  ZonesRepositoryImpl(
      {required this.zonesLocalDataSource,
      required this.zonesRemoteDataSource});

  @override
  Future<Either<Failure, List<SubZone>>> getMainZoneSubZones(
      {required int mainZoneId}) async {
    try {
      final result = await zonesRemoteDataSource.getMainZoneSubZones(
          mainCategoryId: mainZoneId);
      return Right(result.data as List<SubZone>);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Either<Failure, List<SubZone>> getPastZones() {
    try {
      final result = zonesLocalDataSource.getPastZones();
      return Right(result);
    } on CacheException {
      return const Left(CacheFailure(message: 'حدث مشكلة اثناء جلب المناطق'));
    }
  }

  @override
  void setZone({required SubZone zone}) {
    try {
      zonesLocalDataSource.setZone(subZone: zone);
    } on CacheException {
      debugPrint('حدث مشكلة اثناء حفظ المنطقة');
    }
  }

  @override
  Future<Either<Failure, List<MainZone>>> getAllMainZones() async {
    try {
      final result = await zonesRemoteDataSource.getAllMainZones();
      return Right(result.data as List<MainZone>);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }
}
