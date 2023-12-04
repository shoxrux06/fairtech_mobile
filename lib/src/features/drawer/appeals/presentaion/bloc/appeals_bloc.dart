import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/appeal_image_type_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/profile_data_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/send_appeal_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/domain/models/appeal_model.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/domain/repository/appeals_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'appeals_bloc.freezed.dart';

part 'appeals_event.dart';

part 'appeals_state.dart';

class AppealsBloc extends Bloc<AppealsEvent, AppealsState> {
  final AppealsRepository appealsRepository;

  AppealsBloc(this.appealsRepository) : super(const AppealsState()) {
    on<GetProfileDataEvent>(_getProfileData);
    on<SendAppealEvent>(_sendAppealEvent);
    on<GetImageTypeEvent>(_getImageType);
    on<GetAppealTypeEvent>(_getAppealType);
  }

  FutureOr<void> _getProfileData(
    GetProfileDataEvent event,
    Emitter<AppealsState> emit,
  ) async {
    final result = await appealsRepository.getProfileData(event.context);
    result.when(
      success: (data) {
        emit(state.copyWith(profileDataResponse: data));
      },
      failure: (failure) {},
    );
  }

  FutureOr<void> _sendAppealEvent(
    SendAppealEvent event,
    Emitter<AppealsState> emit,
  ) async {
    emit(state.copyWith(appealIsSending: true));
    final result = await appealsRepository.sendAppeal(event.context,event.appealModel);
    result.when(
      success: (data) {
        emit(state.copyWith(sendAppealResponse: data, appealIsSending: false));
      },
      failure: (failure) {
        emit(state.copyWith(appealIsSending: false));
      },
    );
  }

  FutureOr<void> _getImageType(GetImageTypeEvent event, Emitter<AppealsState> emit,) async{
    emit(state.copyWith(appealIsSending: true));
    final result = await appealsRepository.getImageTypeList(event.context);
    result.when(
      success: (data) {
        emit(state.copyWith(appealImageTypeResponse: data, appealIsSending: false));
      },
      failure: (failure) {
        emit(state.copyWith(appealIsSending: false));
      },
    );
  }

  FutureOr<void> _getAppealType(GetAppealTypeEvent event, Emitter<AppealsState> emit,) async{
    emit(state.copyWith(appealIsSending: true));
    final result = await appealsRepository.getAppealTypeList(event.context);
    result.when(
      success: (data) {
        // emit(state.copyWith(appealImageTypeResponse: data, appealIsSending: false));
      },
      failure: (failure) {
        emit(state.copyWith(appealIsSending: false));
      },
    );
  }
}
