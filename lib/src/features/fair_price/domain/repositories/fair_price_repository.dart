import 'dart:io';

import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/created_price_product_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_product_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/one_product_all_sums_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/company_data_with_tin_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/market_product_list_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/obyekt_type_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/person_data-with_pinfl_entity.dart';
import 'package:flutter/material.dart';
import '../entity/product_price_history_list_entity.dart';

abstract class FairPriceRepository {
  Future<ApiResult<List<MarketListResponse>>>  getOuterMarketList(
      BuildContext context,
      String keyword,
      String type,
      );

  Future<ApiResult<List<MarketListResponse>>>  getMarketList(
    BuildContext context,
    String keyword,
    String type,
      int soato
  );

  Future<ApiResult<MarketProductListResponse>>
      getMarketBranchEmployeeProductList(
    BuildContext context,
  );

  Future<ApiResult<List<MarketProductListEntity>>> getMarketProductList(
    BuildContext context,
      String code,
  );

  Future<ApiResult<MarketProductListEntity>> getMarketProductListByType(
      BuildContext context,
      String code,
      String type,
      );

  Future<ApiResult<MarketProductListEntity>> getMarketProductListById(
      BuildContext context,
      int id,
      );

  Future<ApiResult<CompanyDataWithTinEntity>> getCompanyDataWithTin(
      BuildContext context,
      String tin,
      );

  Future<ApiResult<PersonDataWithPinflEntity>> getPersonDataWithPinfl(
      BuildContext context,
      String pinfl,
      );

  Future<ApiResult<CreatedPriceProductResponse>> createProductPrice(
    BuildContext context,
    double maxPrice,
    double middleSum,
    double minPrice,
    int productId,
    int marketId,
      File file,
      {
    bool isMarketEmployee = false,
  });

  Future<ApiResult<ProductPriceHistoryListEntity>> getProductPriceHistory(
    BuildContext context,
    String keyword,
    String code,
  );
  Future<ApiResult<OneProductAllSumsResponse>> getOneProductAllSums(
      BuildContext context,
      int productId,
      int marketId1,
      int marketId2,
      int marketId3,
      int soato,
      );
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
      );

  Future<ApiResult<ObyektTypeEntity>> getObyektTypeList(
      BuildContext context,
      );
}
