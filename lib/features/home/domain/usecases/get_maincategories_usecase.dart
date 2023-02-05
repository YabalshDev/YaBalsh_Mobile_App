import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/category.dart';
import 'package:yabalash_mobile_app/features/home/domain/repositories/home_repository.dart';

class GetMainCategoriesUseCase implements UseCase<List<Category>, NoParams> {
  final HomeRepository homeRepository;

  GetMainCategoriesUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) =>
      homeRepository.getMainCategories();
}
