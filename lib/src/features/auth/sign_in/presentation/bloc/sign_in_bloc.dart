import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/data/models/edit_password_response.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/data/models/one_id_auth_response.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/domain/repository/sign_in_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_bloc.freezed.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignUpEvent, SignInState> {
  final SignInRepository signUpRepository;

  SignInBloc(this.signUpRepository) : super(const SignInState()) {
    on<GetOneIdDataEvent>(_getOneIdData);
  }

  FutureOr<void> _getOneIdData(
    GetOneIdDataEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(oneIdAuthResponseIsNotNull: true));
    final result = await signUpRepository.getOneIdData(event.context,event.resultCode);
    result.when(
      success: (data) async {
        event.onSuccess();
        emit(state.copyWith(oneIdAuthResponse: data,oneIdAuthResponseIsNotNull: false));
        await LocalStorage.instance.setToken(data.token.toString());
        await LocalStorage.instance.setUserName(data.username.toString());
        await LocalStorage.instance.setUserPassword(data.password.toString());
        await LocalStorage.instance.setFullName('${data.firstName} ${data.lastName}');
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(oneIdAuthResponseIsNotNull: false));
      },
    );
  }

}
