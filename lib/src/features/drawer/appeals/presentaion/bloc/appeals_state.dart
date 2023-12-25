part of 'appeals_bloc.dart';

@freezed
class AppealsState with _$AppealsState{
  const factory AppealsState({
    ProfileDataResponse? profileDataResponse,
    AppealTypeResponse? appealTypeResponse,
    AppealImageTypeResponse? appealImageTypeResponse,
    SendAppealResponse? sendAppealResponse,
    AppealTinDataResponse? appealTinDataResponse,
    @Default(false)bool appealIsSending,
    @Default(false)bool appealIsSent
}) = Initial;
}

