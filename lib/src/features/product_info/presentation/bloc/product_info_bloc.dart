import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/mxik_and_shtrix_code_response.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/product_info_response.dart';
import 'package:fairtech_mobile/src/features/product_info/domain/repository/product_info_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'product_info_bloc.freezed.dart';

part 'product_info_event.dart';

part 'product_info_state.dart';

class ProductInfoBloc extends Bloc<ProductInfoEvent, ProductInfoState> {
  final ProductInfoRepository servicesRepository;

  ProductInfoBloc(this.servicesRepository) : super(const ProductInfoState()) {
    on<GetProductInfoByTnVedEvent>(_getProductInfoByTnVed);
    on<GetProductInfoByScannerEvent>(_getProductInfoByScanner);
    on<GetProductInfoByMxikCodeEvent>(_getProductInfoByMxikCode);
  }

  FutureOr<void> _getProductInfoByTnVed(
    GetProductInfoByTnVedEvent event,
    Emitter<ProductInfoState> emit,
  ) async {
    emit(state.copyWith(isGettingProductData: true));
    final result = await servicesRepository.getProductInfoByTnVed(event.context,event.tnVedCode);
    result.when(
      success: (data) {
        event.onSuccess();
        emit(state.copyWith(productInfoResponse: data,isGettingProductData: false, isSuccessProductData: true));
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(isGettingProductData: false,isSuccessProductData: false));
      },
    );
  }

  FutureOr<void> _getProductInfoByScanner(
      GetProductInfoByScannerEvent event,
      Emitter<ProductInfoState> emit,
      ) async {
    emit(state.copyWith(isGettingProductDataByScanner: true));
    final result = await servicesRepository.getProductInfoByScanner(event.context,event.lang, event.internationalCode);
    result.when(
      success: (data) {
        event.onSuccess();
        emit(state.copyWith(mxikAndShtrixCodeResponse: data,isGettingProductDataByScanner: false,isSuccessProductDataByScanner: true));
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(isGettingProductDataByScanner: false,isSuccessProductDataByScanner: false));
      },
    );
  }

  FutureOr<void> _getProductInfoByMxikCode(
      GetProductInfoByMxikCodeEvent event,
      Emitter<ProductInfoState> emit,
      ) async {
    emit(state.copyWith(isGettingProductDataByMxikCode: true));
    final result = await servicesRepository.getProductInfoByMxiCode(event.context,event.lang, event.mxikCode);
    result.when(
      success: (data) {
        event.onSuccess();
        emit(state.copyWith(mxikCodeResponse: data,isGettingProductDataByMxikCode: false,isSuccessProductDataByMxikCode: true));
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(isGettingProductDataByMxikCode: false,isSuccessProductDataByMxikCode: false));
      },
    );
  }

}
