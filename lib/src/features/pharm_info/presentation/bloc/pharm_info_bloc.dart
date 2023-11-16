import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/profile_data_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/get_region_list_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/pharm_info_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/status_count_outside_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/domain/repositories/pharm_info_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'pharm_info_event.dart';

part 'pharm_info_bloc.freezed.dart';

part 'pharm_info_state.dart';

class PharmInfoBloc extends Bloc<PharmInfoEvent, PharmInfoState> {
  final PharmInfoRepository pharmInfoRepository;

  PharmInfoBloc(this.pharmInfoRepository) : super(PharmInfoState()) {
    on<GetPharmInfoEvent>(_onGetPharmInfo);
    on<GetRegionListEvent>(_onGetRegionList);
    on<GetProfileDataEvent>(_onGetProfileData);
    on<GetAppealsCountEvent>(_onGetAppealsCount);
  }

  FutureOr<void> _onGetPharmInfo(
    GetPharmInfoEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result = await pharmInfoRepository.getPharmInfo(event.context,event.keyword, event.status, event.itemsPerPage, event.page);
    result.when(
      success: (data) {
        event.onSuccess();
        emit(state.copyWith(pharmInfoResponse: data));
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(isErrorOccurredWhileGettingPharmInfo: true));
      },
    );
  }

  FutureOr<void> _onGetRegionList(
    GetRegionListEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result = await pharmInfoRepository.getRegionList();
    result.when(
      success: (data) {
        emit(state.copyWith(getRegionListResponse: data));
      },
      failure: (failure) {},
    );
  }

  FutureOr<void> _onGetProfileData(
    GetProfileDataEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result = await pharmInfoRepository.getProfileData();
    result.when(
      success: (data) {
        emit(state.copyWith(profileDataResponse: data));
      },
      failure: (failure) {},
    );
  }

  FutureOr<void> _onGetAppealsCount(
    GetAppealsCountEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result = await pharmInfoRepository.getAppealsCount();
    result.when(
      success: (data) {
        emit(state.copyWith(statusCountOutsideResponse: data));
      },
      failure: (failure) {},
    );
  }
}
