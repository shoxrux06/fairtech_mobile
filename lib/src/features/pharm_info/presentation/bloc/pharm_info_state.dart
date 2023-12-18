part of 'pharm_info_bloc.dart';

@freezed
class PharmInfoState with _$PharmInfoState{
  const factory PharmInfoState({
    PharmInfoResponse? pharmInfoResponse,
    ProductAppealCountResponse? productAppealCountResponse,
    OneIdAuthResponse? oneIdAuthResponse,
    ProductAppealListResponse? productAppealListResponse,
    @Default([])List<GetRegionListResponse?> getRegionListResponse,
    ProfileDataResponse? profileDataResponse,
    StatusCountOutsideResponse? statusCountOutsideResponse,
    @Default(false) bool isErrorOccurredWhileGettingPharmInfo
}) = Initial;
}
