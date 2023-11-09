import 'dart:io';
import 'package:dio/io.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/di/inject.dart';
import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/handlers/network_exceptions.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/pharm_info_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/domain/repositories/pharm_info_repository.dart';

class PharmInfoRepositoryImpl implements PharmInfoRepository {
  @override
  Future<ApiResult<PharmInfoResponse>> getPharmInfo(String keyword, String status, int itemsPerPage, int page) async {
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
      print('==> products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
