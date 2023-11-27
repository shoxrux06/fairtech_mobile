part of 'product_info_bloc.dart';

@immutable
abstract class ProductInfoEvent {}

class GetProductInfoEvent extends ProductInfoEvent{
  final Function() onSuccess;
  final Function() onError;
  final String tnVedCode;

  GetProductInfoEvent({
    required this.onSuccess,
    required this.onError,
    required this.tnVedCode}
      );
}
