part of 'fair_price_bloc.dart';

@immutable
abstract class FairPriceEvent {}

class GetMarketListEvent extends FairPriceEvent {
  final BuildContext context;
  final String keyword;
  final String type;

  GetMarketListEvent({
    required this.context,
    required this.keyword,
    required this.type,
  });
}

class GetMarketProductListEvent extends FairPriceEvent {
  final BuildContext context;

  GetMarketProductListEvent({
    required this.context,
  });
}

class GetMarketEmployeeProductListEvent extends FairPriceEvent {
  final BuildContext context;

  GetMarketEmployeeProductListEvent({
    required this.context,
  });
}

class CreateProductPriceEvent extends FairPriceEvent {
  final Function() onSuccess;
  final Function() onError;
  final BuildContext context;
  final double maxPrice;
  final double middlePrice;
  final double minPrice;
  // final String date;
  final int productId;
  final int marketId;
  final bool isMarketEmployee;

  CreateProductPriceEvent({
    required this.onSuccess,
    required this.onError,
    required this.context,
    required this.maxPrice,
    required this.middlePrice,
    required this.minPrice,
    // required this.date,
    required this.productId,
    required this.marketId,
    required this.isMarketEmployee,
  });

// class GetProductPriceListEvent extends FairPriceEvent {
//   final BuildContext context;
//   final String keyword;
//   final Function() onSuccess;
//   final Function() onError;
//
//   GetProductPriceListEvent({
//     required this.context,
//     required this.keyword,
//     required this.onSuccess,
//     required this.onError,
//   });
// }
}

