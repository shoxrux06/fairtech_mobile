part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState{
  const factory SignInState({
    OneIdAuthResponse? oneIdAuthResponse,
    EditPasswordResponse? editPasswordResponse,
    @Default([])List<String> pinCode,
    @Default(false) bool box1,
    @Default(false) bool box2,
    @Default(false) bool box3,
    @Default(false) bool box4,
    @Default(false) bool oneIdAuthResponseIsNotNull,
}) = Initial;
}
