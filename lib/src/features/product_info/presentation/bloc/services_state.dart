part of 'services_bloc.dart';

@freezed
class ServicesState with _$ServicesState{
  const factory ServicesState({
    ProductInfoResponse? productInfoResponse,
    @Default(false) bool isGettingProductData,
    @Default(false) bool isGotProductData,
}) = Initial;
}

