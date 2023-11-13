part of 'pharm_info_bloc.dart';

@immutable
abstract class PharmInfoEvent {}

class GetPharmInfoEvent extends PharmInfoEvent {
  final Function onSuccess;
  final Function onError;
  final String keyword;
  final String status;
  final int itemsPerPage;
  final int page;

  GetPharmInfoEvent({
    required this.onSuccess,
    required this.onError,
    required this.keyword,
    required this.status,
    required this.itemsPerPage,
    required this.page,
  });
}

class GetRegionListEvent extends PharmInfoEvent {}
class GetProfileDataEvent extends PharmInfoEvent {}
class GetAppealsCountEvent extends PharmInfoEvent {}
