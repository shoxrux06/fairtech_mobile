part of 'product_info_bloc.dart';

@freezed
class ProductInfoState with _$ProductInfoState {
  const factory ProductInfoState({
    ProductInfoResponse? productInfoResponse,
    MxikAndShtrixCodeResponse? mxikAndShtrixCodeResponse,
    MxikAndShtrixCodeResponse? mxikCodeResponse,
    @Default(false) bool isGettingProductData,
    @Default(false) bool isGettingProductDataByScanner,
    @Default(false) bool isGettingProductDataByMxikCode,
    @Default(false) bool isGotProductData,
    @Default(false) bool isGotProductDataByScanner,
    @Default(false) bool isGotProductDataByMxikCode,
}) = Initial;
}

