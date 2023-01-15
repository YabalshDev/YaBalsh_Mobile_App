import 'package:yabalash_mobile_app/core/api/remote_data_api/rest_api_provider.dart';
import 'package:yabalash_mobile_app/features/reciepies/data/datasources/recipie_mock_data_source.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';

class RecipieRemoteDatasource implements RecipieDataSource {
  final RestApiProvider restApiProvider;

  RecipieRemoteDatasource({required this.restApiProvider});
  @override
  Future<List<Brand>> getAllBrands() {
    // TODO: implement getAllBrands
    throw UnimplementedError();
  }

  @override
  Future<List<Recipie>> getAllRecipies() {
    // TODO: implement getAllRecipies
    throw UnimplementedError();
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
