part of 'sign_in_bloc.dart';

@immutable
abstract class SignUpEvent {}

class GetOneIdDataEvent extends SignUpEvent {
  final Function() onSuccess;
  final Function() onError;
  final BuildContext context;
  final dynamic resultCode;

  GetOneIdDataEvent({
    required this.onSuccess,
    required this.onError,
    required this.context,
    required this.resultCode,
  });
}

