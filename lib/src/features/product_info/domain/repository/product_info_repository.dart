import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/mxik_and_shtrix_code_response.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/product_info_response.dart';

abstract class ProductInfoRepository{
  Future<ApiResult<ProductInfoResponse>> getProductInfoByTnVed(String  tnvedCode);
  Future<ApiResult<MxikAndShtrixCodeResponse>> getProductInfoByScanner(String lang, String internationalCode);
  Future<ApiResult<MxikAndShtrixCodeResponse>> getProductInfoByMxiCode(String lang, String mxikCode);
}