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

class GetAllRegionListEvent extends AppealsEvent {
  final BuildContext context;

  GetAllRegionListEvent({
    required this.context,
  });
}

class GetImageTypeEvent extends AppealsEvent {
  final BuildContext context;

  GetImageTypeEvent({
    required this.context,
  });
}

class GetAppealTypeEvent extends AppealsEvent {
  final BuildContext context;

  GetAppealTypeEvent({
    required this.context,
  });
}

class GetAppealsTinDataEvent extends AppealsEvent {
  final BuildContext context;
  final String tin;

  GetAppealsTinDataEvent({
    required this.context,
    required this.tin,
  });
}
