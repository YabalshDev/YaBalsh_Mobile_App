part of 'product_details_cubit.dart';

class ProductDetailsState extends Equatable {
  final bool? withNearStores;
  final Product? product;
  final RequestState? productRequestState;
  final RequestState? popularProductsRequestState;
  final RequestState? productVariationRequestState;
  final List<Product>? productVaraiations;
  final List<Product>? popularProducts;
  final bool? showMore;

  const ProductDetailsState(
      {this.withNearStores = true,
      this.showMore = true,
      this.product = const Product(),
      this.productRequestState = RequestState.loading,
      this.popularProductsRequestState = RequestState.loading,
      this.productVariationRequestState = RequestState.loading,
      this.productVaraiations = const [],
      this.popularProducts = const []});

  ProductDetailsState copyWith(
          {bool? withNearStores,
          Product? product,
          bool? showMore,
          RequestState? productRequestState,
          RequestState? popularProductsRequestState,
          RequestState? productVariationRequestState,
          List<Product>? productVaraiations,
          List<Product>? popularProducts}) =>
      ProductDetailsState(
          showMore: showMore ?? this.showMore,
          popularProducts: popularProducts ?? this.popularProducts,
          popularProductsRequestState:
              popularProductsRequestState ?? this.popularProductsRequestState,
          product: product ?? this.product,
          productRequestState: productRequestState ?? this.productRequestState,
          productVaraiations: productVaraiations ?? this.productVaraiations,
          productVariationRequestState:
              productVariationRequestState ?? this.productVariationRequestState,
          withNearStores: withNearStores ?? this.withNearStores);

  @override
  List<Object> get props => [
        withNearStores!,
        product!,
        showMore!,
        productRequestState!,
        popularProductsRequestState!,
        productVariationRequestState!,
        productVaraiations!,
        popularProducts!
      ];
}
