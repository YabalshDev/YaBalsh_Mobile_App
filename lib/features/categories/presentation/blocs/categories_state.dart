part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  final List<CategorySectionData>? categorySections;
  final RequestState? categorySectionsRequestState;
  final String? categoriesError;
  const CategoriesState(
      {this.categorySections = const [],
      this.categorySectionsRequestState = RequestState.loading,
      this.categoriesError = ''});

  CategoriesState copyWith(
          {List<CategorySectionData>? categorySections,
          RequestState? categorySectionsRequestState,
          String? categoriesError}) =>
      CategoriesState(
          categoriesError: categoriesError ?? this.categoriesError,
          categorySections: categorySections ?? this.categorySections,
          categorySectionsRequestState: categorySectionsRequestState ??
              this.categorySectionsRequestState);
  @override
  List<Object> get props =>
      [categorySections!, categorySectionsRequestState!, categoriesError!];
}
