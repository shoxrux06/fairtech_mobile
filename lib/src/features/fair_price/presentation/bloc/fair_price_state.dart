part of 'fair_price_bloc.dart';

@freezed
class FairPriceState with _$FairPriceState {
  const factory FairPriceState({
    @Default([])List<MarketListResponse> marketListResponse,
    ProductPriceListResponse? productPriceListResponse,
    MarketProductListResponse? marketProductListResponse,
    OneProductAllSumsResponse? oneProductAllSumsResponse,
    @Default([])List<MarketProductListEntity> marketProductListEntity,
    MarketProductListEntity? marketProductEntity,
    CreatedPriceProductResponse? createdPriceProductResponse,
    ProductPriceHistoryListEntity? productPriceHistoryListEntity,
    CompanyDataWithTinEntity? companyDataWithTinEntity,
    PersonDataWithPinflEntity? personDataWithPinflEntity,
    ObyektTypeEntity? obyektTypeEntity,
    @Default(false) bool isCreatingProductPrice,
    @Default(false) bool isCreatedProductPrice,
    @Default(false) bool marketListLoading,
    @Default(false) bool marketListError,
    @Default(false) bool productListLoading,
    @Default(false) bool productAllPriceLoading,
    @Default(false) bool isFetchingTinData,
    @Default(false) bool isFetchingPinflData,
    @Default(false) bool obyektIsCreating,
    @Default(false) bool obyektIsCreated,
    @Default(0) int createObyektStatusCode
}) = Initial;
}

