import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/appeal_image_type_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/appeal_type_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/profile_data_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/send_appeal_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/domain/models/appeal_model.dart';
import 'package:flutter/cupertino.dart';

abstract class AppealsRepository{
  Future<ApiResult<ProfileDataResponse>> getProfileData(BuildContext context);
  Future<ApiResult<SendAppealResponse>> sendAppeal(BuildContext context,AppealModel appealModel,);
  Future<ApiResult<AppealImageTypeResponse>> getImageTypeList(BuildContext context,);
  Future<ApiResult<AppealTypeResponse>> getAppealTypeList(BuildContext context,);
}