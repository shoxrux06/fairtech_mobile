part of 'sign_in_bloc.dart';

@immutable
abstract class SignUpEvent {}

class GetOneIdDataEvent extends SignUpEvent {
  final BuildContext context;
  final dynamic resultCode;

  GetOneIdDataEvent({required this.context,required this.resultCode});
}

class PinCodeEvent extends SignUpEvent{
  final String digit;

  PinCodeEvent({required this.digit});
}


class EditPasswordEvent extends SignUpEvent {
  final BuildContext context;
  final int userId;
  final String userName;
  final String password;

  EditPasswordEvent({
    required this.context,
    required this.userId,
    required this.userName,
    required this.password,
  });
}
