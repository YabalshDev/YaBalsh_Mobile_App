part of 'product_details_cubit.dart';

class ProductDetailsState extends Equatable {
  final bool? withNearStores;
  final Product? product;
  final RequestState? productRequestState;
  final RequestState? popularProductsRequestState;
  final RequestState? productVariationRequestState;
  final List<Product>? productVaraiations;
  final List<Product>? popularProducts;
  final List<Store>? productStores;
  final List<Store>? nearStores;
  final bool? showMore;
  final int? selectedVariantIndex;

  const ProductDetailsState(
      {this.withNearStores = true,
      this.selectedVariantIndex = -1,
      this.showMore = true,
      this.product = const Product(),
      this.productStores = const [],
      this.nearStores = const [],
      this.productRequestState = RequestState.loading,
      this.popularProductsRequestState = RequestState.loading,
      this.productVariationRequestState = RequestState.loading,
      this.productVaraiations = const [],
      this.popularProducts = const []});

  ProductDetailsState copyWith(
          {bool? withNearStores,
          Product? product,
          bool? showMore,
          int? selectedVariantIndex,
          List<Store>? productStores,
          List<Store>? nearStores,
          RequestState? productRequestState,
          RequestState? popularProductsRequestState,
          RequestState? productVariationRequestState,
          List<Product>? productVaraiations,
          List<Product>? popularProducts}) =>
      ProductDetailsState(
          selectedVariantIndex:
              selectedVariantIndex ?? this.selectedVariantIndex,
          showMore: showMore ?? this.showMore,
          popularProducts: popularProducts ?? this.popularProducts,
          nearStores: nearStores ?? this.nearStores,
          popularProductsRequestState:
              popularProductsRequestState ?? this.popularProductsRequestState,
          product: product ?? this.product,
          productRequestState: productRequestState ?? this.productRequestState,
          productVaraiations: productVaraiations ?? this.productVaraiations,
          productStores: productStores ?? this.productStores,
          productVariationRequestState:
              productVariationRequestState ?? this.productVariationRequestState,
          withNearStores: withNearStores ?? this.withNearStores);

  @override
  List<Object> get props => [
        withNearStores!,
        productStores!,
        nearStores!,
        product!,
        showMore!,
        productRequestState!,
        popularProductsRequestState!,
        productVariationRequestState!,
        productVaraiations!,
        popularProducts!,
        selectedVariantIndex!
      ];
}
