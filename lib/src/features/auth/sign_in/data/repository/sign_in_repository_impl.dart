import 'dart:io';

import 'package:dio/io.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/di/inject.dart';
import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/handlers/network_exceptions.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/data/models/edit_password_response.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repository/sign_in_repository.dart';
import '../models/one_id_auth_response.dart';

class SignInRepositoryImpl extends SignInRepository {
  @override
  Future<ApiResult<OneIdAuthResponse>> getOneIdData(BuildContext context, dynamic resultCode) async {
    try {
      final client = inject<HttpService>().client(requireAuth: false, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient= () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final response = await client.get(AppConstants.redirect, queryParameters: {
        'code': '${resultCode['code']}',
        'state': '${resultCode['state']}',
      });
      if(response.data == ''){
        AppSnackBar.showErrorSnackBar(context, 'Error', 'Ro\'yxatdan o\'tish jarayonida xatolik yuz berdi');
      }
      return ApiResult.success(data: OneIdAuthResponse.fromJson(response.data));
    } catch (e) {
      print('==> products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
