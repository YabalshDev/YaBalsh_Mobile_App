import 'package:yabalash_mobile_app/core/constants/constantdata/creators_mock_data_list.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/recipies_mock_data_list.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/creator.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../../../../core/api/remote_data_api/api_error_model.dart';
import '../../../../core/errors/exceptions.dart';

abstract class RecipieDataSource {
  Future<List<Creator>> getAllCreators();
  Future<List<Recipie>> getAllRecipies();
}

class RecipiesMockDataSource implements RecipieDataSource {
  @override
  Future<List<Creator>> getAllCreators() async {
    try {
      List<Creator> creators = [];
      await Future.delayed(
        const Duration(seconds: 2),
        () => creators = creatorsMock,
      );

      return creators;
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
}
