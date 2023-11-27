import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/product_info_response.dart';

abstract class ProductInfoRepository{
  Future<ApiResult<ProductInfoResponse>> getProductInfo(String  tnvedCode);
}