part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable{}


class MainEventChanged extends MainEvent {
  MainEventChanged(this.menu);

  final BottomMenu menu;

  @override
  List<Object?> get props => [menu];
}