import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

abstract class RecipieDataSource {
  Future<List<Brand>> getAllBrands({int? page});
  Future<List<Recipie>> getAllRecipies({int? page});
  Future<List<Recipie>> getBrandRecipies({required int brandId, int? page});
  Future<Recipie> getRecipieDetails({required int recipieId});
}
