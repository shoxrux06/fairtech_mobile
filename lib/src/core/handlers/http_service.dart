import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/handlers/token_interceptor.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';


class HttpService {
  Dio client({bool requireAuth = false, required BuildContext context,}) => Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrlLocal,
      connectTimeout: const Duration(milliseconds:  60 * 1000),
      receiveTimeout: const Duration(milliseconds:  60 * 1000),
      sendTimeout: const Duration(milliseconds:  60 * 1000),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Accept-Language': LocalStorage.instance.getLanguage(),
      },
    ),
  )
    ..interceptors.add(TokenInterceptor(context: context,requireAuth: requireAuth))
    ..interceptors.add(LogInterceptor());


  // setCertificate(){
  //   (client(context: null).httpClientAdapter as IOHttpClientAdapter).createHttpClient= () =>
  //   HttpClient()
  //     ..badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  // }

}
