import 'dart:io';
import 'package:dio/io.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/di/inject.dart';
import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/handlers/network_exceptions.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/data/models/one_id_auth_response.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/profile_data_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/get_region_list_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/pharm_info_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/product_appeal_count_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/product_appeal_list_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/domain/repositories/pharm_info_repository.dart';
import 'package:flutter/cupertino.dart';

class PharmInfoRepositoryImpl implements PharmInfoRepository {

  @override
  Future<ApiResult<PharmInfoResponse>> getPharmInfo(BuildContext context,String keyword, String status, int itemsPerPage, int page) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () => HttpClient()..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
      final data = {"itemsPerPage":itemsPerPage,"page":page};
      final response = await client.post(
        '${AppConstants.getPharmInfo}keyword=$keyword&status=$status',
        data: data,
      );
      return ApiResult.success(data: PharmInfoResponse.fromJson(response.data));
    } catch (e) {
      AppSnackBar.showErrorSnackBar(context, 'Error', 'Error occurred');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<GetRegionListResponse>>> getRegionList(BuildContext context) async{
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final response = await client.get(
        AppConstants.getRegionList,
      );
      print('getRegionList  ** ${response.data} **');
      return ApiResult.success(data: List.from(response.data.map((e) => GetRegionListResponse.fromJson(e))));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileDataResponse>> getProfileData(BuildContext context)async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
        AppConstants.getProfileData,
      );
      return ApiResult.success(data: ProfileDataResponse.fromJson(response.data));
    } catch (e) {
      print('==> failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductAppealCountResponse>> getAppealsCount(BuildContext context) async{
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
        AppConstants.getAppealsCount,
      );
      print('^^^^^response -->$response^^^^^');
      return ApiResult.success(data: ProductAppealCountResponse.fromJson(response.data));
    } catch (e) {
      print('==> failure: $e');
      AppSnackBar.showErrorSnackBar(context, 'Error','${e.toString()}');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<OneIdAuthResponse>> updateUserToken(BuildContext context,String username)async {
    try {
      final client = inject<HttpService>().client(requireAuth: false, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
        AppConstants.updateToken,
        data: {
          "username":username,
          "password":username
        }
      );
      return ApiResult.success(data: OneIdAuthResponse.fromJson(response.data));
    } catch (e) {
      print('==> failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductAppealListResponse>> getAppealsList(BuildContext context, String status)async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
          '${AppConstants.getProductAppealsList}keyword=&status=$status',
          data: {
            "page":0,
            "itemsPerPage":50
          }
      );
      return ApiResult.success(data: ProductAppealListResponse.fromJson(response.data));
    } catch (e) {
      print('==> failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  // @override
  // Future<ApiResult<GetAppealsByPhoneAndPinflResponse>> getAppealsByJSHSHIR(BuildContext context, String jshshir) async{
  //   try {
  //     final client = inject<HttpService>().client(requireAuth: false, context: context);
  //     (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
  //     HttpClient()
  //       ..badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //     final response = await client.post(
  //         '${AppConstants.getProductAppealsCount}phoneNumber=&pinfl=$jshshir',
  //         data: {
  //           "page":0,
  //           "itemsPerPage":50
  //         }
  //     );
  //     return ApiResult.success(data: GetAppealsByPhoneAndPinflResponse.fromJson(response.data));
  //   } catch (e) {
  //     print('==> failure: $e');
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }
  //
  // @override
  // Future<ApiResult<GetAppealsByPhoneAndPinflResponse>> getAppealsByPhoneNumber(BuildContext context, String phoneNumber)async {
  //   try {
  //     final client = inject<HttpService>().client(requireAuth: true, context: context);
  //     (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
  //     HttpClient()
  //       ..badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //     final response = await client.post(
  //         '${AppConstants.getProductAppealsCount}phoneNumber=$phoneNumber&pinfl=',
  //         data: {
  //           "page":0,
  //           "itemsPerPage":50
  //         }
  //     );
  //     return ApiResult.success(data: GetAppealsByPhoneAndPinflResponse.fromJson(response.data));
  //   } catch (e) {
  //     print('==> failure: $e');
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }
}
