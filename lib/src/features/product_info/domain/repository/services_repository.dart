import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/data/models/product_info_response.dart';

abstract class ServicesRepository{
  Future<ApiResult<ProductInfoResponse>> getProductInfo(String  tnvedCode);
}