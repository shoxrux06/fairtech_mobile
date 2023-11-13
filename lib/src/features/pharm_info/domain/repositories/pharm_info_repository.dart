import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/profile_data_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/get_region_list_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/pharm_info_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/status_count_outside_response.dart';

abstract class PharmInfoRepository{
  Future<ApiResult<PharmInfoResponse>> getPharmInfo(String keyword, String status,int itemsPerPage, int page);
  Future<ApiResult<List<GetRegionListResponse>>> getRegionList();
  Future<ApiResult<ProfileDataResponse>> getProfileData();
  Future<ApiResult<StatusCountOutsideResponse>> getAppealsCount();
}