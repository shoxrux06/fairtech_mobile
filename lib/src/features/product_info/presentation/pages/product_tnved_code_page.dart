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

  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductInfoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(title: state.productInfoResponse != null?'Results': 'Send by TnVed code'),
            body: ModalProgressHUD(
              inAsyncCall: state.isGettingProductData,
              child: state.productInfoResponse != null?
              TnVedCodeResponseWidget(productInfoResponse: state.productInfoResponse):
              (state.productInfoResponse?.data.isEmpty?? false)?
              const Center(
                child: Text('No data'),
              ):
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Enter the code'),
                    AppUtils.kGap4,
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.done,
                      controller: codeController,
                      hintText: '- - - - - - - - - -',
                      onFieldSubmitted: (value) {
                        context.read<ProductInfoBloc>().add(
                          GetProductInfoEvent(
                              onSuccess: () {
                                AppSnackBar.showSuccessSnackBar(context, 'Success','Results fetched successfully');
                              },
                              onError: () {
                                AppSnackBar.showErrorSnackBar(context, 'Error','Error');
                              },
                              tnVedCode: value
                          ),
                        );
                      },
                      suffixIcon: IconButton(
                          onPressed: () {
                            context.read<ProductInfoBloc>().add(
                              GetProductInfoEvent(
                                onSuccess: () {
                                  AppSnackBar.showSuccessSnackBar(context, 'Success','Results fetched successfully');
                                },
                                onError: () {
                                  AppSnackBar.showErrorSnackBar(context,'Error', 'Error');
                                },
                                tnVedCode: codeController.text,
                              ),
                            );
                          },
                          icon: const Icon(Icons.check)),
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
