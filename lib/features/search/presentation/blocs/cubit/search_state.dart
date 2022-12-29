part of 'search_cubit.dart';

class SearchState extends Equatable {
  final int? searchTypeIndex;
  final List<String>? searchHistory;
  final List<Product>? searchProductsResult;
  final List<StoreSearch>? searchStoresResult;
  final RequestState? searchHistoryRequestState;
  final RequestState? searchProductsRequestState;
  final RequestState? searchStoresRequestState;
  final String? errorMessage;

  const SearchState({
    this.searchTypeIndex = 0,
    this.searchHistory = const [],
    this.searchProductsResult = const [],
    this.searchStoresResult = const [],
    this.searchHistoryRequestState = RequestState.loading,
    this.searchProductsRequestState = RequestState.loading,
    this.searchStoresRequestState = RequestState.loading,
    this.errorMessage = '',
  });

  SearchState copyWith(
          {int? searchTypeIndex,
          List<String>? searchHistory,
          List<Product>? searchProductsResult,
          List<StoreSearch>? searchStoresResult,
          RequestState? searchHistoryRequestState,
          RequestState? searchProductsRequestState,
          RequestState? searchStoresRequestState,
          String? errorMessage}) =>
      SearchState(
          errorMessage: errorMessage ?? this.errorMessage,
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
        searchTypeIndex!
      ];
}
