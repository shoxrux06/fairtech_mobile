import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/di/inject.dart';
import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/handlers/network_exceptions.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/data/models/product_info_response.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/domain/repository/services_repository.dart';

class ServicesRepositoryImpl implements ServicesRepository{
  @override
  Future<ApiResult<ProductInfoResponse>> getProductInfo(String  tnvedCode) async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post('${AppConstants.getProductInfo}?tnvedCode=$tnvedCode');
      return ApiResult.success(data:ProductInfoResponse.fromJson(response.data));
    } catch (e) {
      print('==> products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}