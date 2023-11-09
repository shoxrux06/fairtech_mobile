import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fairtech_mobile/src/core/di/inject.dart';
import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/handlers/network_exceptions.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/send_appeal_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/domain/models/appeal_model.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/domain/repository/appeals_repository.dart';
import 'package:flutter/cupertino.dart';
import '../models/profile_data_response.dart';

class AppealsRepositoryImpl implements AppealsRepository {
  @override
  Future<ApiResult<ProfileDataResponse>> getProfileData(BuildContext context) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient= () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.post('/api/v.1/outer-cabinet/profile-data');
      return ApiResult.success(data: ProfileDataResponse.fromJson(response.data));
    } catch (e) {
      print('==> products failure: $e');
      AppSnackBar.showErrorSnackBar(context, 'Error','${e.toString()}');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SendAppealResponse>> sendAppeal(BuildContext context,AppealModel appealModel) async {
    try {
      final formData = FormData.fromMap({
        "applier_type" : appealModel.applierType,
        "applier_jshshir" : appealModel.applierJshshir,
        "applier_number" : appealModel.applierNumber,
        "applier_fullname" : appealModel.applierFullname,
        "applier_zipcode" : appealModel.applierZipcode,
        "applier_address" : appealModel.applierAddress,
        "appeal_type" : appealModel.appealType,
        "appeal_subtype" : appealModel.appealSubtype,
        "appeal_description" : appealModel.appealDescription,
        'appeal_file':  await Future.wait(
          appealModel.appealFileList.map((file) async {
            return await MultipartFile.fromFile(file?.path??'');
          }),
        )
      });
      final client = inject<HttpService>().client(requireAuth: true);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient= () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
        '/api/v.1/outer-cabinet/send-appeal',
        data: formData,
      );
      print('response 444 $response');
      return ApiResult.success(data:SendAppealResponse.fromJson(response.data));
    } catch (e) {
      print('==> products failure: $e');
      AppSnackBar.showErrorSnackBar(context, 'Error','${e.toString()}');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
