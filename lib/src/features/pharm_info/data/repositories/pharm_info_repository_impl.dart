import 'dart:io';
import 'package:dio/io.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/di/inject.dart';
import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/handlers/network_exceptions.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/profile_data_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/get_region_list_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/pharm_info_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/product_appeal_count_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/status_count_outside_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/domain/repositories/pharm_info_repository.dart';
import 'package:flutter/cupertino.dart';

class PharmInfoRepositoryImpl implements PharmInfoRepository {


  @override
  Future<ApiResult<PharmInfoResponse>> getPharmInfo(BuildContext context,String keyword, String status, int itemsPerPage, int page) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
      final data = {"itemsPerPage":itemsPerPage,"page":page};
      final response = await client.post(
        '${AppConstants.getPharmInfo}keyword=$keyword&status=$status',
        data: data,
      );
      return ApiResult.success(data: PharmInfoResponse.fromJson(response.data));
    } catch (e) {
      print('==> failure: $e');
      AppSnackBar.showErrorSnackBar(context, 'Error', 'Error occurred');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<GetRegionListResponse>>> getRegionList() async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.get(
        AppConstants.getRegionList,
      );
      return ApiResult.success(data: List.from(response.data.map((e) => GetRegionListResponse.fromJson(e))));
    } catch (e) {
      print('==> failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileDataResponse>> getProfileData()async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
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
  Future<ApiResult<ProductAppealCountResponse>> getAppealsCount() async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
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
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
