import 'package:yabalash_mobile_app/core/api/remote_data_api/endpoints.dart';
import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/datasources/recipie_mock_data_source.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/models/brands_response_model.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/models/recipie_details_response_model.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';

import '../models/recipies_response_model.dart';

class RecipieRemoteDatasource implements RecipieDataSource {
  final RestApiProvider restApiProvider;

  RecipieRemoteDatasource({required this.restApiProvider});
  @override
  Future<List<Brand>> getAllBrands({int? page}) async {
    final response = await restApiProvider.get(brandsEndpoint,
        queryParams: page != null ? {'page': page} : null);
    final decodedData = BrandsResponseModel.fromJson(response);
    return decodedData.data as List<Brand>;
  }

  @override
  Future<List<Recipie>> getAllRecipies({int? page}) async {
    final response = await restApiProvider.get(recipiesEndpoint,
        queryParams: page != null ? {'page': page} : null);
    final decodedData = RecipiesResponseModel.fromJson(response);
    return decodedData.data as List<Recipie>;
  }

  @override
  Future<List<Recipie>> getBrandRecipies(
      {required int brandId, int? page}) async {
    final response = await restApiProvider.get(
        getBrandsRecipiesEndpoint(brandId),
        queryParams: page != null ? {'page': page} : null);
    final decodedData = RecipiesResponseModel.fromJson(response);
    return decodedData.data as List<Recipie>;
  }

  @override
  Future<Recipie> getRecipieDetails({required int recipieId}) async {
    final response =
        await restApiProvider.get(getRecipieDetailsEndPointById(recipieId));
    final decodedData = RecipieDetailsResponseModel.fromJson(response);
    return decodedData.data as Recipie;
  }
}
