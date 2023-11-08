import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/data/models/product_info_response.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/domain/repository/services_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'services_bloc.freezed.dart';

part 'services_event.dart';

part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServicesRepository servicesRepository;

  ServicesBloc(this.servicesRepository) : super(const ServicesState()) {
    on<GetProductInfoEvent>(_getProductInfo);
  }

  FutureOr<void> _getProductInfo(
    GetProductInfoEvent event,
    Emitter<ServicesState> emit,
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
