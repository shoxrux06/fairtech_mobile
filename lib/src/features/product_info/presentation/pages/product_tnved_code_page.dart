import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/widgets/tn_ved_code_response_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTnVedCodePage extends StatefulWidget {
  const ProductTnVedCodePage({super.key});

  @override
  State<ProductTnVedCodePage> createState() => _ProductTnVedCodePageState();
}

class _ProductTnVedCodePageState extends State<ProductTnVedCodePage> {
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductInfoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(title: state.productInfoResponse?.status == 1?'Natijalar': 'TnVed kod orqali yuborish'),
            body: ModalProgressHUD(
              inAsyncCall: state.isGettingProductData,
              child: (state.productInfoResponse?.status == 1)?
              TnVedCodeResponseWidget(productInfoResponse: state.productInfoResponse):
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('TnVed kodni kiriting'),
                    AppUtils.kGap4,
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.done,
                      controller: codeController,
                      hintText: '- - - - - - - - - -',
                      onFieldSubmitted: (value) {
                        context.read<ProductInfoBloc>().add(
                          GetProductInfoByTnVedEvent(
                              onSuccess: () {
                                if(state.productInfoResponse?.status == -1){
                                  AppSnackBar.showErrorSnackBar(context, 'Xatolik yuz berdi','So\'rov notog\'ri yuborilgan');
                                }else if(state.productInfoResponse?.status == 1){
                                  AppSnackBar.showSuccessSnackBar(context, 'Muvaffaqiyatli yuklab olindi','Ma\'lumotlar muaffaqiyatli olib kelindi');
                                }
                              },
                              onError: () {
                                AppSnackBar.showErrorSnackBar(context,'Error', 'Error');
                              },
                              tnVedCode: value
                          ),
                        );
                      },
                      suffixIcon: IconButton(
                          onPressed: () {
                            context.read<ProductInfoBloc>().add(
                              GetProductInfoByTnVedEvent(
                                onSuccess: () {
                                  if(state.productInfoResponse?.status == -1){
                                    AppSnackBar.showErrorSnackBar(context, 'Xatolik yuz berdi','So\'rov notog\'ri yuborilgan');
                                  }else if(state.productInfoResponse?.status == 1){
                                    AppSnackBar.showSuccessSnackBar(context, 'Muvaffaqiyatli yuklab olindi','Ma\'lumotlar muaffaqiyatli olib kelindi');
                                  }
                                },
                                onError: () {
                                  AppSnackBar.showErrorSnackBar(context,'Error', 'Error');
                                },
                                tnVedCode: codeController.text,
                              ),
                            );
                          },
                          icon: const Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
