import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/data/models/edit_password_response.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/one_id_auth_response.dart';

abstract class SignInRepository{
  Future<ApiResult<OneIdAuthResponse>> getOneIdData(BuildContext context,dynamic resultCode);
  Future<ApiResult<EditPasswordResponse>> editPassword(BuildContext context,int userID,String userName, String password);
}