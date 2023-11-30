part of 'appeals_bloc.dart';

@immutable
abstract class AppealsEvent {}

class GetProfileDataEvent extends AppealsEvent {
  final BuildContext context;

  GetProfileDataEvent({required this.context});
}

class SendAppealEvent extends AppealsEvent {
  final BuildContext context;
  final AppealModel appealModel;

  SendAppealEvent({
    required this.context,
    required this.appealModel,
  });
}

class GetImageTypeEvent extends AppealsEvent {
  final BuildContext context;

  GetImageTypeEvent({
    required this.context,
  });
}
