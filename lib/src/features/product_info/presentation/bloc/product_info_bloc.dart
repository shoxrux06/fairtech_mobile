import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/product_info_response.dart';
import 'package:fairtech_mobile/src/features/product_info/domain/repository/product_info_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'product_info_bloc.freezed.dart';

part 'product_info_event.dart';

part 'product_info_state.dart';

class ProductInfoBloc extends Bloc<ProductInfoEvent, ProductInfoState> {
  final ProductInfoRepository servicesRepository;

  ProductInfoBloc(this.servicesRepository) : super(const ProductInfoState()) {
    on<GetProductInfoEvent>(_getProductInfo);
  }

  FutureOr<void> _getProductInfo(
    GetProductInfoEvent event,
    Emitter<ProductInfoState> emit,
  ) async {
    emit(state.copyWith(isGettingProductData: true));
    final result = await servicesRepository.getProductInfo(event.tnVedCode);
    result.when(
      success: (data) {
        event.onSuccess();
        emit(state.copyWith(productInfoResponse: data,isGettingProductData: false, isGotProductData: true));
      },
      failure: (failure) {
        event.onError();
        emit(state.copyWith(isGettingProductData: false));
      },
    );
  }
}
