import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/created_price_product_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/market_product_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/one_product_all_sums_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/data/models/product_price_list_response.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/company_data_with_tin_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/market_product_list_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/person_data-with_pinfl_entity.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/product_price_history_list_entity.dart';
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
    on<GetOuterMarketListEvent>(getOuterMarketList);
    on<GetMarketProductListEvent>(getMarketProductList);
    on<GetMarketProductListByTypeEvent>(getMarketProductListByType);
    on<GetMarketEmployeeProductListEvent>(getMarketBranchEmployeeProductList);
    on<CreateProductPriceEvent>(createProductPrice);
    on<GetProductPriceHistoryEvent>(getProductPriceHistory);
    on<GetOneProductAllSumsEvent>(getOneProductAllSums);
    on<GetCompanyDataWithTinEvent>(getCompanyDataWithTin);
    on<GetPersonDataWithPinflEvent>(getPersonDataWithPinfl);
    on<CreateObyektEvent>(createObyekt);
    on<GetProductByIdEvent>(getProductById);
  }

  FutureOr<void> getMarketList(
    GetMarketListEvent event,
    Emitter<FairPriceState> emit,
  ) async {
    emit(state.copyWith(marketListLoading: true));
    final result = await fairPriceRepository.getMarketList(event.context, event.keyword, event.type, event.soato);
    result.when(
      success: (data) {
        emit(state.copyWith(marketListResponse: data, marketListLoading: false));
        event.onSuccess();
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(marketListLoading: false, marketListError: true));
        print('Error getMarketProductList occurred');
      },
    );
  }

  FutureOr<void> getOuterMarketList(
      GetOuterMarketListEvent event,
      Emitter<FairPriceState> emit,
      ) async {
    emit(state.copyWith(marketListLoading: true));
    final result = await fairPriceRepository.getOuterMarketList(event.context, event.keyword, event.type);
    result.when(
      success: (data) {
        emit(state.copyWith(marketListResponse: data, marketListLoading: false));
        event.onSuccess();
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(marketListLoading: false, marketListError: true));
        print('Error getMarketProductList occurred');
      },
    );
  }


  FutureOr<void> getMarketProductList(
    GetMarketProductListEvent event,
    Emitter<FairPriceState> emit,
  ) async {
    emit(state.copyWith(productListLoading: true));
    final result = await fairPriceRepository.getMarketProductList(event.context, event.code);
    result.when(
      success: (data) {
        emit(state.copyWith(marketProductListEntity: data, productListLoading: false));
        event.onSuccess();
        print('Data222 ***$data***');
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(productListLoading: false));
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
      event.file,
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

  FutureOr<void> getProductPriceHistory(
      GetProductPriceHistoryEvent event,
      Emitter<FairPriceState> emit,
      ) async {
    final result =
    await fairPriceRepository.getProductPriceHistory(event.context, event.keyword, event.code);
    result.when(
      success: (data) {
        emit(state.copyWith(productPriceHistoryListEntity: data));
      },
      failure: (failure) {
        print('Error occurred');
      },
    );
  }

  FutureOr<void> getOneProductAllSums(
      GetOneProductAllSumsEvent event,
      Emitter<FairPriceState> emit
      ) async {
    emit(state.copyWith(productAllPriceLoading: true));
    final result = await fairPriceRepository.getOneProductAllSums(event.context, event.productId, event.marketId1, event.marketId2, event.marketId3, event.soato);
    result.when(
      success: (data) {
        emit(state.copyWith(oneProductAllSumsResponse: data,productAllPriceLoading: false));
        event.onSuccess();
      },
      failure: (failure) {
        print('Error occurred');
        emit(state.copyWith(productAllPriceLoading: false));
        event.onError();
      },
    );
  }

  FutureOr<void> getCompanyDataWithTin(GetCompanyDataWithTinEvent event, Emitter<FairPriceState> emit,)async {
    emit(state.copyWith(isFetchingTinData: true));
    final result = await fairPriceRepository.getCompanyDataWithTin(event.context, event.tin);
    result.when(
      success: (data) {
        emit(state.copyWith(companyDataWithTinEntity: data, isFetchingTinData: false));
        event.onSuccess();
      },
      failure: (failure) {
        print('Error occurred');
        emit(state.copyWith(isFetchingTinData: false));
        event.onError();
      },
    );
  }

  FutureOr<void> getPersonDataWithPinfl(GetPersonDataWithPinflEvent event, Emitter<FairPriceState> emit,)async {
    emit(state.copyWith(isFetchingPinflData: true));
    final result = await fairPriceRepository.getPersonDataWithPinfl(event.context, event.pinfl);
    result.when(
      success: (data) {
        emit(state.copyWith(personDataWithPinflEntity: data, isFetchingPinflData: false));
        event.onSuccess();
      },
      failure: (failure) {
        print('Error occurred');
        emit(state.copyWith(isFetchingPinflData: false));
        event.onError();
      },
    );
  }

  FutureOr<void> createObyekt(CreateObyektEvent event, Emitter<FairPriceState> emit,)async {
    emit(state.copyWith(obyektIsCreating: true));
    final result = await fairPriceRepository.createObyekt(
        event.context, event.address,
        event.businessStructureId,
        event.businessStructureName,
        event.marketTypeId, event.soato,
        event.statusId, event.tin,
        event.marketName,
        event.lat,
        event.lang,
        event.pinfl,
        event.isYuridik,
    );
    result.when(
      success: (data) {
        emit(state.copyWith(createObyektStatusCode: data, obyektIsCreating: false));
        event.onSuccess();
      },
      failure: (failure) {
        print('Error occurred');
        emit(state.copyWith(obyektIsCreating: false));
        event.onError();
      },
    );
  }

  FutureOr<void> getProductById(GetProductByIdEvent event, Emitter<FairPriceState> emit,) async {
    final result = await fairPriceRepository.getMarketProductListById(event.context, event.id);
    result.when(
      success: (data) {
        emit(state.copyWith(marketProductEntity: data));
        event.onSuccess();
      },
      failure: (failure) {
        event.onError();
      },
    );
  }

  FutureOr<void> getMarketProductListByType(GetMarketProductListByTypeEvent event, Emitter<FairPriceState> emit,) async {
    emit(state.copyWith(productListLoading: true));
    final result = await fairPriceRepository.getMarketProductListByType(event.context, event.code, event.type);
    result.when(
      success: (data) {
        emit(state.copyWith(marketProductEntity: data, productListLoading: false));
        event.onSuccess();
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(productListLoading: false));
      },
    );
  }
}
