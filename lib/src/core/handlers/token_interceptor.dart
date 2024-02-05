import 'package:dio/dio.dart';
import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';


class TokenInterceptor extends Interceptor {
  final BuildContext context;
  final bool requireAuth;

  TokenInterceptor({required this.context,required this.requireAuth});

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final String token = LocalStorage.instance.getToken();
    print('token<$token>');

    if (token.isNotEmpty && requireAuth) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.reject(err);
    // if(err)
    // TODO: implement onError
    // final r = err.response;
    // if (r?.statusCode == 401 || r?.statusCode == 403) {
    //   context.pushReplacement(Routes.signIn);
    // }
  }
}
