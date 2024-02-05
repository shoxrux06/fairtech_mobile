import 'dart:io';
import 'package:dio/io.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/di/inject.dart';
import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/handlers/network_exceptions.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/created_price_product_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/repositories/fair_price_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/market_product_list_response.dart';

class FairPriceRepositoryImpl implements FairPriceRepository {
  @override
  Future<ApiResult<MarketListResponse>> getMarketList(BuildContext context, String keyword, String type) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
        '${AppConstants.getMarketList}keyword=$keyword&type=$type',
          data: {
            'page': 0,
            'itemsPerPage': 50,
          }
      );
      print('MarketList *** ${response.data} ***');
      return ApiResult.success(
          data: MarketListResponse.fromJson(response.data)
      );
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<MarketProductListResponse>> getMarketProductList(BuildContext context) async {
    try {
      final client =
      inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
          AppConstants.getMarketProductList,
          data: {
            'page': 0,
            'itemsPerPage': 50,
          }
      );
      print('Market Product List == **** ${response.data} ****');
      return ApiResult.success(data:MarketProductListResponse.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CreatedPriceProductResponse>> createProductPrice(BuildContext context,double maxPrice, double middleSum,double minPrice, int productId, int marketId,{bool isMarketEmployee = false}) async{
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      if(isMarketEmployee){
        client.options.queryParameters.addAll(
            {
              'maxPrice': maxPrice.toString(),
              'middleSum': middleSum.toString(),
              'minPrice': minPrice.toString(),
              'code': 'app',
              'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
              'productId': productId.toString(),
              'marketId': marketId.toString(),
            }
        );
      }else{
        client.options.queryParameters.addAll(
            {
              'maxPrice': maxPrice.toString(),
              'middleSum': middleSum.toString(),
              'minPrice': minPrice.toString(),
              'code': 'app',
              'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
              'productId': productId.toString(),
              'marketId': marketId.toString(),
            }
        );
      }
      final response = await client.post(
          AppConstants.createProduct,
      );
      print('Market Product List == **** ${response.data} ****');
      return ApiResult.success(data:CreatedPriceProductResponse.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<MarketProductListResponse>> getMarketBranchEmployeeProductList(BuildContext context) async{
    try {
      final client =
      inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
          AppConstants.getMarketBranchEmployeeProductList,
          data: {
            'page': 0,
            'itemsPerPage': 50,
          }
      );
      print('Market Product List == **** ${response.data} ****');
      return ApiResult.success(data:MarketProductListResponse.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  // @override
  // Future<ApiResult<ProductPriceListResponse>> getProductPriceList(BuildContext context, String keyword) async{
  //   try {
  //     final client =
  //     inject<HttpService>().client(requireAuth: true, context: context);
  //     (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
  //     HttpClient()
  //       ..badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //     final response = await client.post(
  //         AppConstants.productPriceList,
  //         data: {
  //           'page': 0,
  //           'itemsPerPage': 50,
  //         }
  //     );
  //     print('ProductPriceListResponse List == **** ${response.data} ****');
  //     return ApiResult.success(data: ProductPriceListResponse.fromJson(response.data));
  //   } catch (e) {
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }
}
