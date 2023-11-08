part of 'services_bloc.dart';

@immutable
abstract class ServicesEvent {}

class GetProductInfoEvent extends ServicesEvent{
  final Function() onSuccess;
  final Function() onError;
  final String tnVedCode;

  GetProductInfoEvent({
    required this.onSuccess,
    required this.onError,
    required this.tnVedCode}
      );
}
