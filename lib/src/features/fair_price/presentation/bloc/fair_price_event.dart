part of 'fair_price_bloc.dart';

@immutable
abstract class FairPriceEvent {}

class GetMarketListEvent extends FairPriceEvent {
  final Function() onSuccess;
  final Function() onError;
  final BuildContext context;
  final String keyword;
  final String type;
  final int soato;

  GetMarketListEvent({
    required this.onSuccess,
    required this.onError,
    required this.context,
    required this.keyword,
    required this.type,
    required this.soato,
  });
}

class GetOuterMarketListEvent extends FairPriceEvent {
  final Function() onSuccess;
  final Function() onError;
  final BuildContext context;
  final String keyword;
  final String type;

  GetOuterMarketListEvent({
    required this.onSuccess,
    required this.onError,
    required this.context,
    required this.keyword,
    required this.type,
  });
}

class GetMarketProductListEvent extends FairPriceEvent {
  final Function() onSuccess;
  final Function() onError;
  final BuildContext context;
  final String code;

  GetMarketProductListEvent({
    required this.onSuccess,
    required this.onError,
    required this.context,
    required this.code,
  });
}

class GetMarketProductListByTypeEvent extends FairPriceEvent {
  final Function() onSuccess;
  final Function() onError;
  final BuildContext context;
  final String code;
  final String type;

  GetMarketProductListByTypeEvent({
    required this.onSuccess,
    required this.onError,
    required this.context,
    required this.code,
    required this.type,
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
  final File file;
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
    required this.file,
    required this.isMarketEmployee,
  });
}
class GetProductPriceHistoryEvent extends FairPriceEvent {
  final BuildContext context;
  final String keyword;
  final String code;
  final Function() onSuccess;
  final Function() onError;

  GetProductPriceHistoryEvent({
    required this.context,
    required this.keyword,
    required this.code,
    required this.onSuccess,
    required this.onError,
  });

}

class GetOneProductAllSumsEvent extends FairPriceEvent {
  final BuildContext context;
  final Function() onSuccess;
  final Function() onError;
  final int productId;
  final int marketId1;
  final int marketId2;
  final int marketId3;
  final int soato;

  GetOneProductAllSumsEvent({
    required this.context,
    required this.onSuccess,
    required this.onError,
    required this.productId,
    required this.marketId1,
    required this.marketId2,
    required this.marketId3,
    required this.soato,
  });

}

class GetCompanyDataWithTinEvent extends FairPriceEvent {
  final BuildContext context;
  final Function() onSuccess;
  final Function() onError;
  final String tin;

  GetCompanyDataWithTinEvent({
    required this.context,
    required this.onSuccess,
    required this.onError,
    required this.tin
  });
}
class GetPersonDataWithPinflEvent extends FairPriceEvent {
  final BuildContext context;
  final Function() onSuccess;
  final Function() onError;
  final String pinfl;

  GetPersonDataWithPinflEvent({
    required this.context,
    required this.onSuccess,
    required this.onError,
    required this.pinfl
  });
}

class GetProductByIdEvent extends FairPriceEvent {
  final BuildContext context;
  final Function() onSuccess;
  final Function() onError;
  final int id;

  GetProductByIdEvent({
    required this.context,
    required this.onSuccess,
    required this.onError,
    required this.id
  });
}

class CreateObyektEvent extends FairPriceEvent {
  final BuildContext context;
  final Function() onSuccess;
  final Function() onError;
  final String address;
  final int businessStructureId;
  final String businessStructureName;
  final int marketTypeId;
  final int soato;
  final int statusId;
  final String tin;
  final String marketName;
  final String lat;
  final String lang;
  final String pinfl;
  final bool isYuridik;

  CreateObyektEvent({
    required this.context,
    required this.onSuccess,
    required this.onError,
    required this.address,
    required this.businessStructureId,
    required this.businessStructureName,
    required this.marketTypeId,
    required this.soato,
    required this.statusId,
    required this.tin,
    required this.marketName,
    required this.lat,
    required this.lang,
    required this.pinfl,
    required this.isYuridik,
  });


}

class GetObyektTypeListEvent extends FairPriceEvent {
  final BuildContext context;

  GetObyektTypeListEvent({
    required this.context,
  });
}
