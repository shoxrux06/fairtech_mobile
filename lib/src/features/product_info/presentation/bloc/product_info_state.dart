part of 'product_info_bloc.dart';

@freezed
class ProductInfoState with _$ProductInfoState{
  const factory ProductInfoState({
    ProductInfoResponse? productInfoResponse,
    @Default(false) bool isGettingProductData,
    @Default(false) bool isGotProductData,
}) = Initial;
}

