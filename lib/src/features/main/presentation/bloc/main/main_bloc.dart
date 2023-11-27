import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'main_bloc.freezed.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainEventChanged>(_onChangeMenu);
  }

  FutureOr<void> _onChangeMenu(
    MainEventChanged event,
    Emitter<MainState> emit,
  ) {
    emit(state.copyWith(bottomMenu: event.menu));
  }
}

enum BottomMenu {
  home,
  star,
  services,
}

enum BottomMenuTitle {
  home,
  star,
  services,
}
