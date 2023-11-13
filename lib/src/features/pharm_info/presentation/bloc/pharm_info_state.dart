part of 'pharm_info_bloc.dart';

@freezed
class PharmInfoState with _$PharmInfoState{
  const factory PharmInfoState({
    PharmInfoResponse? pharmInfoResponse,
    @Default([])List<GetRegionListResponse?> getRegionListResponse,
    ProfileDataResponse? profileDataResponse,
    StatusCountOutsideResponse? statusCountOutsideResponse,
}) = Initial;
}
