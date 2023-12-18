import 'package:fairtech_mobile/src/core/extension/extension.dart';
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
          appBar: CustomAppBar(
              title: (state.productInfoResponse?.status == 1 || state.productInfoResponse?.status == 0 || state.productInfoResponse == null)
                  ? 'Natijalar'
                  : 'TnVed kod orqali yuborish'),
          body: ModalProgressHUD(
            inAsyncCall: state.isGettingProductData,
            child: (state.productInfoResponse?.status == 1)
                ? TnVedCodeResponseWidget(
                    productInfoResponse: state.productInfoResponse)
                : (state.productInfoResponse?.status == 0)
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Tanlangan mahsulot "Milliy tasnif" da ro\'yxatdan o\'tmagan',
                            style: context.textStyle.regularTitle2
                                .copyWith(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Padding(
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
                                if (value.length == 10) {
                                  context.read<ProductInfoBloc>().add(
                                        GetProductInfoByTnVedEvent(
                                            context: context,
                                            onSuccess: () {},
                                            onError: () {
                                              AppSnackBar.showErrorSnackBar(
                                                  context,
                                                  'Xatolik yuz berdi',
                                                  'Server xatoligi yoki noto\'g\'ri so\'rov');
                                            },
                                            tnVedCode: value),
                                      );
                                } else {
                                  AppSnackBar.showWarningSnackBar(context,
                                      'TnVed kod noto\'g\'ri kiritilgan');
                                }
                              },
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    if (codeController.text.length == 10) {
                                      context.read<ProductInfoBloc>().add(
                                            GetProductInfoByTnVedEvent(
                                              context: context,
                                              onSuccess: () {},
                                              onError: () {
                                                AppSnackBar.showErrorSnackBar(
                                                    context,
                                                    'Xatolik yuz berdi',
                                                    'Server xatoligi yoki noto\'g\'ri so\'rov');
                                              },
                                              tnVedCode: codeController.text,
                                            ),
                                          );
                                    } else {
                                      AppSnackBar.showWarningSnackBar(context,
                                          'TnVed kod noto\'g\'ri kiritilgan');
                                    }
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
