import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/data/models/one_id_auth_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/profile_data_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/get_region_list_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/pharm_info_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/product_appeal_count_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/product_appeal_list_response.dart';
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
    on<GetProfileDataPharmEvent>(_onGetProfileData);
    on<UpdateUserTokenEvent>(_updateUserToken);
    on<GetAppealsCountEvent>(_onGetAppealsCount);
    on<GetAppealsListEvent>(_onGetAppealsList);
    // on<GetAppealsByPhoneEvent>(_onGetAppealByPhone);
    // on<GetAppealsByJshshirEvent>(_onGetAppealByJshshir);
  }

  FutureOr<void> _onGetPharmInfo(
    GetPharmInfoEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result = await pharmInfoRepository.getPharmInfo(event.context,
        event.keyword, event.status, event.itemsPerPage, event.page);
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
    final result = await pharmInfoRepository.getRegionList(event.context);
    result.when(
      success: (data) {
        emit(state.copyWith(getRegionListResponse: data));
        event.onSuccess();
      },
      failure: (failure) {
        event.onError();
      },
    );
  }

  FutureOr<void> _onGetProfileData(
    GetProfileDataPharmEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result = await pharmInfoRepository.getProfileData(event.context);
    result.when(
      success: (data) {
        emit(state.copyWith(profileDataResponse: data));
        LocalStorage.instance.setUserImageUrl(data.passportPhoto);
        LocalStorage.instance.setUserId(int.tryParse(data.userId));
      },
      failure: (failure) {},
    );
  }

  FutureOr<void> _onGetAppealsCount(
    GetAppealsCountEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result = await pharmInfoRepository.getAppealsCount(event.context);
    result.when(
      success: (data) {
        emit(state.copyWith(productAppealCountResponse: data));
        LocalStorage.instance.setAllAppealNumber(data.created);
        LocalStorage.instance.setProcessAppealNumber(data.process);
        LocalStorage.instance.setFinishedAppealNumber(data.finished);
      },
      failure: (failure) {},
    );
  }

  FutureOr<void> _onGetAppealsList(
    GetAppealsListEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result =
        await pharmInfoRepository.getAppealsList(event.context, event.status);
    result.when(
      success: (data) {
        emit(state.copyWith(productAppealListResponse: data));
      },
      failure: (failure) {},
    );
  }

  FutureOr<void> _updateUserToken(
    UpdateUserTokenEvent event,
    Emitter<PharmInfoState> emit,
  ) async {
    final result = await pharmInfoRepository.updateUserToken(
        event.context, event.username);
    result.when(
      success: (data) async {
        bool isAccessToFairPrice = false;
        String fairPriceAccessRoleName = '';
        for (var role in data.roles) {
          if (role.code == 'HYPERMARKET' || role.code == 'MARKET') {
            isAccessToFairPrice = true;
            fairPriceAccessRoleName = role.name;
            print('*** isAccessToFairPrice $isAccessToFairPrice fairPriceAccessRoleName $fairPriceAccessRoleName ***');
          }
        }
        emit(
          state.copyWith(
            oneIdAuthResponse: data,
            isAccessToFairPrice: isAccessToFairPrice,
            fairPriceAccessRoleName: fairPriceAccessRoleName,
          ),
        );
        print('Token in main page ==> ${data.token}');
        await LocalStorage.instance.setToken(data.token);
      },
      failure: (failure) {},
    );
  }

// FutureOr<void> _onGetAppealByPhone(
//     GetAppealsByPhoneEvent event,
//     Emitter<PharmInfoState> emit,
//     ) async {
//   final result = await pharmInfoRepository.updateUserToken(event.context,event.phoneNumber);
//   result.when(
//     success: (data)async {
//       emit(state.copyWith(oneIdAuthResponse: data));
//       print('Token in main page ==> ${data.token}');
//       await LocalStorage.instance.setToken(data.token);
//     },
//     failure: (failure) {},
//   );
// }
// FutureOr<void> _onGetAppealByJshshir(
//     GetAppealsByJshshirEvent event,
//     Emitter<PharmInfoState> emit,
//     ) async {
//   final result = await pharmInfoRepository.updateUserToken(event.context,event.jshshir);
//   result.when(
//     success: (data)async {
//       emit(state.copyWith(oneIdAuthResponse: data));
//       print('Token in main page ==> ${data.token}');
//       await LocalStorage.instance.setToken(data.token);
//     },
//     failure: (failure) {},
//   );
// }
}
