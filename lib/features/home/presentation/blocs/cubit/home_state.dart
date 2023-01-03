part of 'home_cubit.dart';

class HomeState extends Equatable {
  final String? lastOffersError;
  final List<MainCategory>? lastOffers;
  final RequestState? lastOfferrequestState;
  final String? bannersError;
  final List<Banner>? banners;
  final RequestState? bannersRequestState;
  final String? nearStoresError;
  final List<Store>? nearStores;
  final RequestState? nearStoreRequestState;
  final String? sectionsError;
  final List<HomeSection>? homeSections;
  final RequestState? homeSectionsRequestState;
  final int? currentBannerIndex;

  const HomeState(
      {this.lastOffersError = '',
      this.currentBannerIndex = 0,
      this.lastOffers = const [],
      this.lastOfferrequestState = RequestState.loading,
      this.bannersError = '',
      this.banners = const [],
      this.bannersRequestState = RequestState.loading,
      this.nearStoresError = '',
      this.nearStores = const [],
      this.nearStoreRequestState = RequestState.loading,
      this.sectionsError = '',
      this.homeSections = const [],
      this.homeSectionsRequestState = RequestState.loading});

  HomeState copyWith({
    String? lastOffersError,
    List<MainCategory>? lastOffers,
    RequestState? lastOfferrequestState,
    String? bannersError,
    List<Banner>? banners,
    RequestState? bannersRequestState,
    String? nearStoresError,
    List<Store>? nearStores,
    RequestState? nearStoreRequestState,
    String? sectionsError,
    List<HomeSection>? homeSections,
    RequestState? homeSectionsRequestState,
    int? currentBannerIndex,
  }) {
    return HomeState(
        lastOffers: lastOffers ?? this.lastOffers,
        lastOffersError: lastOffersError ?? this.lastOffersError,
        lastOfferrequestState:
            lastOfferrequestState ?? this.lastOfferrequestState,
        banners: banners ?? this.banners,
        bannersError: bannersError ?? this.bannersError,
        bannersRequestState: bannersRequestState ?? this.bannersRequestState,
        sectionsError: sectionsError ?? this.sectionsError,
        homeSections: homeSections ?? this.homeSections,
        homeSectionsRequestState:
            homeSectionsRequestState ?? this.homeSectionsRequestState,
        nearStoreRequestState:
            nearStoreRequestState ?? this.nearStoreRequestState,
        nearStores: nearStores ?? this.nearStores,
        nearStoresError: nearStoresError ?? this.nearStoresError,
        currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex);
  }

  @override
  List<Object> get props => [
        lastOfferrequestState!,
        lastOffers!,
        lastOfferrequestState!,
        bannersError!,
        banners!,
        bannersRequestState!,
        nearStoresError!,
        nearStores!,
        nearStoreRequestState!,
        sectionsError!,
        homeSections!,
        homeSectionsRequestState!,
        currentBannerIndex!
      ];
}
