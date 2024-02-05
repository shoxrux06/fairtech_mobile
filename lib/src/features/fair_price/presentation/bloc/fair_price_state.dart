part of 'fair_price_bloc.dart';

@freezed
class FairPriceState with _$FairPriceState {
  const factory FairPriceState({
    MarketListResponse? marketListResponse,
    ProductPriceListResponse? productPriceListResponse,
    MarketProductListResponse? marketProductListResponse,
    CreatedPriceProductResponse? createdPriceProductResponse,
    @Default(false) bool isCreatingProductPrice,
    @Default(false) bool isCreatedProductPrice,
    @Default(false) bool marketListLoading,
    @Default(false) bool marketListError,
    @Default(false) bool productListLoading,
}) = Initial;
}

