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
    @Default(false) bool isSuccessProductData,
    @Default(false) bool isSuccessProductDataByScanner,
    @Default(false) bool isSuccessProductDataByMxikCode,
}) = Initial;
}

