import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/categories/data/models/sub_category_response_model.dart';

abstract class CategoriesDataSource {
  Future<SubCategoriesResponseModel> getMainCategorySubCategories(
      {required int mainCategoryId});
}

class CategoriesRemoteDataSourceImpl implements CategoriesDataSource {
  final RestApiProvider restApiProvider;

  CategoriesRemoteDataSourceImpl({required this.restApiProvider});

  @override
  Future<SubCategoriesResponseModel> getMainCategorySubCategories(
      {required int mainCategoryId}) async {
    final response =
        await restApiProvider.get(getSubCategoriesEndPointById(mainCategoryId));

    return SubCategoriesResponseModel.fromJson(response);
  }
}
