import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/pharm_info_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/domain/repositories/pharm_info_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'pharm_info_event.dart';
part 'pharm_info_bloc.freezed.dart';
part 'pharm_info_state.dart';

class PharmInfoBloc extends Bloc<PharmInfoEvent, PharmInfoState> {
  final PharmInfoRepository pharmInfoRepository;
  PharmInfoBloc(this.pharmInfoRepository) : super(PharmInfoState()) {
    on<GetPharmInfoEvent>(_onGetPharmInfo);
  }

  FutureOr<void> _onGetPharmInfo(
    GetPharmInfoEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result = await pharmInfoRepository.getPharmInfo(event.keyword, event.status, event.itemsPerPage, event.page);
    result.when(
      success: (data) {
        event.onSuccess();
        emit(state.copyWith(pharmInfoResponse: data));
      },
      failure: (failure) {
        event.onError();
      },
    );
  }
}
