import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/data/repository.dart';
import 'package:fairtech_mobile/src/features/pdf/data/models/order_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'star_event.dart';

part 'star_state.dart';

part 'star_bloc.freezed.dart';

class StarBloc extends Bloc<StarEvent, StarState> {
  final StarRepository repository;

  StarBloc(this.repository) : super(const StarState()) {
    on<SubmitFilterEvent>(_onSubmit);
  }

  FutureOr<void> _onSubmit(
      SubmitFilterEvent event, Emitter<StarState> emit) async {
    final result = await repository.getData();
    if (result != null) {
      emit(state.copyWith(
        orderItem: result,
        value: event.value,
        filter1: event.filter1,
        filter2: event.filter2,
        filter3: event.filter3,
      ));
    }
  }
}
