import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/di/inject.dart';
import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/core/handlers/http_service.dart';
import 'package:fairtech_mobile/src/core/handlers/network_exceptions.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/drawer/personal_information/presentation/pages/personal_inforamtion_page.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/created_price_product_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/one_product_all_sums_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/company_data_with_tin_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/market_product_list_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/person_data-with_pinfl_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/product_price_history_list_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/repositories/fair_price_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/market_product_list_response.dart';

class FairPriceRepositoryImpl implements FairPriceRepository {
  @override
  Future<ApiResult<List<MarketListResponse>>> getMarketList(
      BuildContext context, String keyword, String type, int soato) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      client.options.queryParameters.addAll({'type': type,'soato': soato});
      final response = await client.get(
        AppConstants.getMarketList,
      );
      print('MarketList *** ${response.data} ***');
      return ApiResult.success(
          data: List.from(response.data.map((e) => MarketListResponse.fromJson(e))));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<MarketProductListEntity>>> getMarketProductList(
      BuildContext context, String code) async {
    try {
      final client =
          inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
      client.options.queryParameters.addAll({
        'code': code,
      });
      final response = await client.post(AppConstants.getMarketProductList);
      print('Market Product List == **** ${response.data} ****');
      return ApiResult.success(
          data: List.from(
              response.data.map((e) => MarketProductListEntity.fromJson(e))));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CreatedPriceProductResponse>> createProductPrice(
      BuildContext context,
      double maxPrice,
      double middleSum,
      double minPrice,
      int productId,
      int marketId,
      File file,
      {bool isMarketEmployee = false}) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () => HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      client.options.queryParameters.addAll({
        'maxPrice': maxPrice.toString(),
        'middleSum': middleSum.toString(),
        'minPrice': minPrice.toString(),
        'code': 'app',
        'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
        'productId': productId.toString(),
        'marketId': marketId.toString()
      });

      var response;
      if(file.path.isNotEmpty){
        final formData = FormData.fromMap({
          'photoPng':  await MultipartFile.fromFile(file.path)
        });
        response = await client.post(
            AppConstants.createProduct,
            data: formData
        );
      }else{
        response = await client.post(
          AppConstants.createProduct,
        );
      }
      return ApiResult.success(data: CreatedPriceProductResponse.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<MarketProductListResponse>>
      getMarketBranchEmployeeProductList(BuildContext context) async {
    try {
      final client =
          inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
      final response = await client
          .post(AppConstants.getMarketBranchEmployeeProductList, data: {
        'page': 0,
        'itemsPerPage': 500,
      });
      print('Market Product List == **** ${response.data} ****');
      return ApiResult.success(
          data: MarketProductListResponse.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductPriceHistoryListEntity>> getProductPriceHistory(
      BuildContext context, String keyword, String code) async {
    try {
      final client =
          inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
      final response =
          await client.post(AppConstants.productPriceHistoryList, data: {
        'page': 0,
        'itemsPerPage': 500,
      });
      print('ProductPriceListResponse List == **** ${response.data} ****');
      return ApiResult.success(
          data: ProductPriceHistoryListEntity.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<OneProductAllSumsResponse>> getOneProductAllSums(
    BuildContext context,
    int productId,
    int marketId1,
    int marketId2,
    int marketId3,
    int soato,
  ) async {
    try {
      final client =
          inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
      client.options.queryParameters.addAll({
        'productId': productId.toString(),
        'marketId1': marketId1.toString(),
        'marketId2': marketId2.toString(),
        'marketId3': marketId3.toString(),
        'soato': soato.toString(),
      });
      final response = await client.post(
        AppConstants.oneProductAllSums,
      );
      print('Market Product List == **** ${response.data} ****');
      return ApiResult.success(
          data: OneProductAllSumsResponse.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CompanyDataWithTinEntity>> getCompanyDataWithTin(BuildContext context, String tin) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
        '${AppConstants.getYuridikInfo}tin=$tin',
      );
      print('**** getCompanyDataWithTin response $response');
      return ApiResult.success(data: CompanyDataWithTinEntity.fromJson(response.data));
    } catch (e) {
      AppSnackBar.showErrorSnackBar(context, 'Error', '${e.toString()}');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<int>> createObyekt(
    BuildContext context,
    String address,
    int businessStructureId,
    String businessStructureName,
    int marketTypeId,
    int soato,
    int statusId,
    String tin,
    String marketName,
    String lat,
    String lang,
      String pinfl,
      bool isYuridik,

  ) async{
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      client.options.responseType = ResponseType.plain;
      final Map<String, dynamic> formData;
      if(isYuridik){
        formData =  {
          "address":address,
          "code":'YURIDIK',
          "businessStructureName": businessStructureName,
          "marketTypeId": marketTypeId,
          "soato": soato,
          "statusId": statusId,
          "tin": tin,
          "marketName":marketName,
          "lat":lat,
          "lang":lang,
        };
      } else {
        formData =  {
          "address":address,
          "code":'YTT',
          "businessStructureName": businessStructureName,
          "marketTypeId": marketTypeId,
          "marketName":marketName,
          "soato": soato,
          "statusId": statusId,
          "pinfl": pinfl,
          "lat":lat,
          "lang":lang,
        };
      }
      final response = await client.post(
        AppConstants.createObyekt,
        data:formData
      );
      print('response.data ======> *** ${response.data} ***');
      print('response.statusCode ======> *** ${response.statusCode} ***');
      return ApiResult.success(data: response.statusCode??0);
    } on DioException catch(e){
      print('Here we createObyekt dio ${e.response?.data}');
      final responseData = e.response?.data;
      dynamic jsonObject =  jsonDecode(responseData);
      print('jsonObject ==>$jsonObject');
      print('Here we createObyekt dio message1 ${jsonObject['message']}');
      AppSnackBar.showErrorSnackBar(context, 'Error', '${jsonObject['message']}');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<MarketProductListEntity>> getMarketProductListById(BuildContext context, int id,) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final response = await client.get(
        '${AppConstants.getMarketProductListById}$id',
      );
      return ApiResult.success(data:MarketProductListEntity.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<MarketListResponse>>> getOuterMarketList(BuildContext context, String keyword, String type) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
        '${AppConstants.getOuterMarketList}keyword=$keyword&type=$type',
        data: {
          'page': 0,
          'itemsPerPage': 500,
          'multiSort': true,
          'mustSort': false,
          'keyword': keyword,
          'type': type
        }
      );
      print('MarketList *** ${response.data} ***');
      return ApiResult.success(data: List.from(response.data['list'].map((e) => MarketListResponse.fromJson(e))));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<MarketProductListEntity>> getMarketProductListByType(BuildContext context, String code, String type) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      client.options.queryParameters.addAll({
        'code': code,
        'type': type,
      });
      final response = await client.post(AppConstants.getMarketProductListByType);
      print('getMarketProductListByType **** ${response.data} ****');
      return ApiResult.success(data:MarketProductListEntity.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<PersonDataWithPinflEntity>> getPersonDataWithPinfl(BuildContext context, String pinfl) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true, context: context);
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final response = await client.post(
        '${AppConstants.getYttInfo}pinfl=$pinfl',
      );
      print('**** getPersonDataWithPinfl response $response');
      return ApiResult.success(data: PersonDataWithPinflEntity.fromJson(response.data));
    } catch (e) {
      AppSnackBar.showErrorSnackBar(context, 'Error', '${e.toString()}');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
