part of 'appeals_bloc.dart';

@freezed
class AppealsState with _$AppealsState{
  const factory AppealsState({
    ProfileDataResponse? profileDataResponse,
    SendAppealResponse? sendAppealResponse,
    @Default(false)bool appealIsSending,
    @Default(false)bool appealIsSent
}) = Initial;
}

