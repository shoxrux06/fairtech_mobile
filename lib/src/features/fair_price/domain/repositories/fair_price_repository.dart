import 'package:fairtech_mobile/src/core/handlers/api_result.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/created_price_product_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_product_list_response.dart';
import 'package:flutter/material.dart';

abstract class FairPriceRepository {
  Future<ApiResult<MarketListResponse>> getMarketList(
    BuildContext context,
    String keyword,
    String type,
  );

  Future<ApiResult<MarketProductListResponse>>
      getMarketBranchEmployeeProductList(
    BuildContext context,
  );

  Future<ApiResult<MarketProductListResponse>> getMarketProductList(
    BuildContext context,
  );

  Future<ApiResult<CreatedPriceProductResponse>> createProductPrice(
    BuildContext context,
    double maxPrice,
    double middleSum,
    double minPrice,
    int productId,
    int marketId, {
    bool isMarketEmployee = false,
  });

  // Future<ApiResult<ProductPriceListResponse>> getProductPriceList(
  //   BuildContext context,
  //   String keyword,
  // );
}
