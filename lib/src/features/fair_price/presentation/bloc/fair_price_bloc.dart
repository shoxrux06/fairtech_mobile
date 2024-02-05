import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/created_price_product_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_product_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/product_price_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/repositories/fair_price_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fair_price_bloc.freezed.dart';

part 'fair_price_event.dart';

part 'fair_price_state.dart';

class FairPriceBloc extends Bloc<FairPriceEvent, FairPriceState> {
  final FairPriceRepository fairPriceRepository;

  FairPriceBloc(this.fairPriceRepository) : super(const FairPriceState()) {
    on<GetMarketListEvent>(getMarketList);
    on<GetMarketProductListEvent>(getMarketProductList);
    on<GetMarketEmployeeProductListEvent>(getMarketBranchEmployeeProductList);
    on<CreateProductPriceEvent>(createProductPrice);
    // on<GetProductPriceListEvent>(getProductPriceList);
  }

  FutureOr<void> getMarketList(
    GetMarketListEvent event,
    Emitter<FairPriceState> emit,
  ) async {
    emit(state.copyWith(marketListLoading: true));
    final result = await fairPriceRepository.getMarketList(event.context, event.keyword, event.type);
    result.when(
      success: (data) {
        emit(state.copyWith(marketListResponse: data, marketListLoading: false));
      },
      failure: (failure) {
        emit(state.copyWith(marketListLoading: false, marketListError: true));
        print('Error getMarketProductList occurred');
      },
    );
  }

  FutureOr<void> getMarketProductList(
    GetMarketProductListEvent event,
    Emitter<FairPriceState> emit,
  ) async {
    final result = await fairPriceRepository.getMarketProductList(event.context);
    result.when(
      success: (data) {
        emit(state.copyWith(marketProductListResponse: data));
      },
      failure: (failure) {
        print('Error getMarketProductList occurred');
      },
    );
  }

  FutureOr<void> getMarketBranchEmployeeProductList(
      GetMarketEmployeeProductListEvent event,
      Emitter<FairPriceState> emit,
      ) async {
    final result = await fairPriceRepository.getMarketBranchEmployeeProductList(event.context);
    result.when(
      success: (data) {
        emit(state.copyWith(marketProductListResponse: data));
      },
      failure: (failure) {

      },
    );
  }

  FutureOr<void> createProductPrice(
    CreateProductPriceEvent event,
    Emitter<FairPriceState> emit,
  ) async {
    emit(state.copyWith(isCreatingProductPrice: true));
    final result = await fairPriceRepository.createProductPrice(
      event.context,
      event.maxPrice,
      event.middlePrice,
      event.minPrice,
      event.productId,
      event.marketId,
      isMarketEmployee: event.isMarketEmployee
    );
    result.when(
      success: (data) {
        emit(state.copyWith(createdPriceProductResponse: data, isCreatingProductPrice: false, isCreatedProductPrice: true));
        event.onSuccess();
      },
      failure: (failure) {
        emit(state.copyWith(isCreatingProductPrice: false));
        event.onError();
      },
    );
  }

  // FutureOr<void> getProductPriceList(
  //     GetProductPriceListEvent event,
  //     Emitter<FairPriceState> emit,
  //     ) async {
  //   final result =
  //   await fairPriceRepository.getProductPriceList(event.context, event.keyword);
  //   result.when(
  //     success: (data) {
  //       emit(state.copyWith(productPriceListResponse: data));
  //     },
  //     failure: (failure) {
  //       print('Error occurred');
  //     },
  //   );
  // }
}
