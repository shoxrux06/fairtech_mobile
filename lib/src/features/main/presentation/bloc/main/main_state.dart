part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(BottomMenu.home)BottomMenu bottomMenu,
  }) = Initial;
}
