import 'package:yabalash_mobile_app/core/constants/constantdata/creators_mock_data_list.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/recipies_mock_data_list.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../../../../core/api/remote_data_api/api_error_model.dart';
import '../../../../core/errors/exceptions.dart';

abstract class RecipieDataSource {
  Future<List<Brand>> getAllBrands();
  Future<List<Recipie>> getAllRecipies();
  Future<List<Recipie>> getBrandRecipies({required int brandId});
  Future<Recipie> getRecipieDetails({required int brandId});
}

class RecipiesMockDataSource implements RecipieDataSource {
  @override
  Future<List<Brand>> getAllBrands() async {
    try {
      List<Brand> brands = [];
      await Future.delayed(
        const Duration(seconds: 2),
        () => brands = creatorsMock,
      );

      return brands;
    } catch (err) {
      throw const ServerException(errorModel: ApiErrorModel());
    }
  }

  @override
  Future<List<Recipie>> getAllRecipies() async {
    try {
      List<Recipie> recipies = [];
      await Future.delayed(
        const Duration(seconds: 2),
        () => recipies = recipiesMock,
      );

      return recipies;
    } catch (err) {
      throw const ServerException(errorModel: ApiErrorModel());
    }
  }

  @override
  Future<List<Recipie>> getBrandRecipies({required int brandId}) {
    // TODO: implement getBrandRecipies
    throw UnimplementedError();
  }

  @override
  Future<Recipie> getRecipieDetails({required int brandId}) {
    // TODO: implement getRecipieDetails
    throw UnimplementedError();
  }
}
