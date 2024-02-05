part of 'pharm_info_bloc.dart';

@immutable
abstract class PharmInfoEvent {}

class GetPharmInfoEvent extends PharmInfoEvent {
  final BuildContext context;
  final Function onSuccess;
  final Function onError;
  final String keyword;
  final String status;
  final int itemsPerPage;
  final int page;

  GetPharmInfoEvent({
    required this.context,
    required this.onSuccess,
    required this.onError,
    required this.keyword,
    required this.status,
    required this.itemsPerPage,
    required this.page,
  });
}

class GetRegionListEvent extends PharmInfoEvent {
  final Function onSuccess;
  final Function onError;
  final BuildContext context;

  GetRegionListEvent({required this.onSuccess,required this.onError,required this.context});
}

class GetProfileDataPharmEvent extends PharmInfoEvent {
  final BuildContext context;

  GetProfileDataPharmEvent({required this.context});
}

class UpdateUserTokenEvent extends PharmInfoEvent {
  final BuildContext context;
  final String username;

  UpdateUserTokenEvent({required this.context,required this.username});
}

class GetAppealsCountEvent extends PharmInfoEvent {
  final BuildContext context;

  GetAppealsCountEvent({required this.context});
}


class GetAppealsListEvent extends PharmInfoEvent {
  final BuildContext context;
  final String status;

  GetAppealsListEvent({required this.context, required this.status});

}

// class GetAppealsByPhoneEvent extends PharmInfoEvent {
//   final BuildContext context;
//   final String phoneNumber;
//
//   GetAppealsByPhoneEvent({required this.context, required this.phoneNumber});
//
// }
//
// class GetAppealsByJshshirEvent extends PharmInfoEvent {
//   final BuildContext context;
//   final String jshshir;
//
//   GetAppealsByJshshirEvent({required this.context, required this.jshshir});
//
// }