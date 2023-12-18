import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/data/models/one_id_auth_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/profile_data_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/get_region_list_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/pharm_info_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/product_appeal_count_response.dart';
import 'package:fairtech_mobile/src/features/pharm_info/data/models/product_appeal_list_response.dart';
import 'package:flutter/cupertino.dart';

abstract class PharmInfoRepository{
  Future<ApiResult<PharmInfoResponse>> getPharmInfo(BuildContext context,String keyword, String status,int itemsPerPage, int page);
  Future<ApiResult<List<GetRegionListResponse>>> getRegionList(BuildContext context);
  Future<ApiResult<ProfileDataResponse>> getProfileData(BuildContext context);
  Future<ApiResult<ProductAppealCountResponse>> getAppealsCount(BuildContext context);
  Future<ApiResult<ProductAppealListResponse>> getAppealsList(BuildContext context, String status);
  Future<ApiResult<OneIdAuthResponse>> updateUserToken(BuildContext context,String username);
}