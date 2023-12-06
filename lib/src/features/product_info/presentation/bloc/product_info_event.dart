part of 'product_info_bloc.dart';

@immutable
abstract class ProductInfoEvent {}

class GetProductInfoByTnVedEvent extends ProductInfoEvent {
  final Function() onSuccess;
  final Function() onError;
  final String tnVedCode;

  GetProductInfoByTnVedEvent({
    required this.onSuccess,
    required this.onError,
    required this.tnVedCode,
  });
}

class GetProductInfoByScannerEvent extends ProductInfoEvent {
  final Function() onSuccess;
  final Function() onError;
  final String lang;
  final String internationalCode;

  GetProductInfoByScannerEvent({
    required this.onSuccess,
    required this.onError,
    required this.lang,
    required this.internationalCode,
  });
}
class GetProductInfoByMxikCodeEvent extends ProductInfoEvent {
  final Function() onSuccess;
  final Function() onError;
  final String lang;
  final String mxikCode;

  GetProductInfoByMxikCodeEvent({
    required this.onSuccess,
    required this.onError,
    required this.lang,
    required this.mxikCode,
  });
}

