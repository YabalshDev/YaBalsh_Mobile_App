part of 'search_cubit.dart';

class SearchState extends Equatable {
  final int? searchTypeIndex;
  final bool? isSearchEmpty;
  final List<String>? searchHistory;
  final List<Product>? searchProductsResult;
  final List<Product>? mostSellingProducts;
  final List<StoreSearch>? searchStoresResult;
  final RequestState? searchHistoryRequestState;
  final RequestState? mostSellingRequestState;
  final RequestState? searchProductsRequestState;
  final RequestState? searchStoresRequestState;
  final Product? chepeastProduct;
  final String? errorMessage;
  final String? intialValue;
  final bool? paginationLoading;

  const SearchState(
      {this.searchTypeIndex = 0,
      this.intialValue = '',
      this.isSearchEmpty = true,
      this.chepeastProduct = const Product(),
      this.searchHistory = const [],
      this.searchProductsResult = const [],
      this.searchStoresResult = const [],
      this.mostSellingProducts = const [],
      this.mostSellingRequestState = RequestState.loading,
      this.searchHistoryRequestState = RequestState.loading,
      this.searchProductsRequestState = RequestState.idle,
      this.searchStoresRequestState = RequestState.idle,
      this.errorMessage = '',
      this.paginationLoading = false});

  SearchState copyWith(
          {int? searchTypeIndex,
          List<String>? searchHistory,
          List<Product>? searchProductsResult,
          List<Product>? mostSellingProducts,
          Product? chepeastProduct,
          List<StoreSearch>? searchStoresResult,
          RequestState? searchHistoryRequestState,
          RequestState? searchProductsRequestState,
          RequestState? searchStoresRequestState,
          RequestState? mostSellingRequestState,
          bool? isSearchEmpty,
          bool? paginationLoading,
          String? intialValue,
          String? errorMessage}) =>
      SearchState(
          paginationLoading: paginationLoading ?? this.paginationLoading,
          intialValue: intialValue ?? this.intialValue,
          chepeastProduct: chepeastProduct ?? this.chepeastProduct,
          mostSellingProducts: mostSellingProducts ?? this.mostSellingProducts,
          mostSellingRequestState:
              mostSellingRequestState ?? this.mostSellingRequestState,
          errorMessage: errorMessage ?? this.errorMessage,
          isSearchEmpty: isSearchEmpty ?? this.isSearchEmpty,
          searchHistory: searchHistory ?? this.searchHistory,
          searchHistoryRequestState:
              searchHistoryRequestState ?? this.searchHistoryRequestState,
          searchProductsRequestState:
              searchProductsRequestState ?? this.searchProductsRequestState,
          searchProductsResult:
              searchProductsResult ?? this.searchProductsResult,
          searchStoresRequestState:
              searchStoresRequestState ?? this.searchStoresRequestState,
          searchStoresResult: searchStoresResult ?? this.searchStoresResult,
          searchTypeIndex: searchTypeIndex ?? this.searchTypeIndex);

  @override
  List<Object> get props => [
        searchTypeIndex!,
        searchHistory!,
        searchProductsResult!,
        searchStoresResult!,
        searchHistoryRequestState!,
        searchProductsRequestState!,
        searchStoresRequestState!,
        errorMessage!,
        searchTypeIndex!,
        isSearchEmpty!,
        mostSellingProducts!,
        mostSellingRequestState!,
        chepeastProduct!,
        intialValue!,
        paginationLoading!
      ];
}
