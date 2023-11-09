import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/pharm_info_response.dart';

abstract class PharmInfoRepository{
  Future<ApiResult<PharmInfoResponse>> getPharmInfo(String keyword, String status,int itemsPerPage, int page);
}