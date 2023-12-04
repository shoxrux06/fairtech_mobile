import 'dart:io';
import 'package:dio/io.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/di/inject.dart';
import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/handlers/network_exceptions.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/product_info_response.dart';
import 'package:fairtech_mobile/src/features/product_info/domain/repository/product_info_repository.dart';

class ProductInfoRepositoryImpl implements ProductInfoRepository{
  @override
  Future<ApiResult<ProductInfoResponse>> getProductInfo(String  tnvedCode) async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient= () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.post('${AppConstants.getProductInfo}tnvedCode=$tnvedCode');
      return ApiResult.success(data:ProductInfoResponse.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}