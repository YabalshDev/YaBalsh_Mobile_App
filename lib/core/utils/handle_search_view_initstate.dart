import 'package:yabalash_mobile_app/core/utils/enums/search_navigation_screens.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';

import '../depedencies.dart';

SearchCubit handleSearchViewInitState(
    SearchNavigationScreens searchNavigationScreens,
    String searchName,
    int id) {
  switch (searchNavigationScreens) {
    case SearchNavigationScreens.homeScreen:
      return getIt<SearchCubit>()
        ..getSearchHistory()
        ..getMostSellingProducts();

    case SearchNavigationScreens.mainCategories:
      return getIt<SearchCubit>()
        ..changeSearchIsEmpty(false)
        ..setIntialSearchValue(searchName)
        ..getSearchHistory()
        ..getMostSellingProducts()
        ..categoryProductsSearch(id, true)
        ..getBestOffer();
    case SearchNavigationScreens.subCategories:
      return getIt<SearchCubit>()
        ..changeSearchIsEmpty(false)
        ..setIntialSearchValue(searchName)
        ..getSearchHistory()
        ..getMostSellingProducts()
        ..categoryProductsSearch(id, true)
        ..getBestOffer();
    case SearchNavigationScreens.nearStoresScreen:
      return getIt<SearchCubit>()
        ..changeSearchType(1)
        ..changeSearchIsEmpty(false)
        ..getSearchHistory()
        ..getMostSellingProducts()
        ..getAllNearStores();
    case SearchNavigationScreens.sections:
      return getIt<SearchCubit>()
        ..changeSearchIsEmpty(false)
        ..setIntialSearchValue(searchName)
        ..getSearchHistory()
        ..getMostSellingProducts()
        ..getSectionProducts(id);
    case SearchNavigationScreens.other:
      return getIt<SearchCubit>()
        ..changeSearchIsEmpty(false)
        ..setIntialSearchValue(searchName)
        ..getSearchHistory()
        ..getMostSellingProducts()
        ..search(searchName);
  }
}
