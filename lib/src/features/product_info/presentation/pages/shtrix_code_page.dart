import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/widgets/mxik_code_response_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShtrixCodePage extends StatefulWidget {
  const ShtrixCodePage({super.key});

  @override
  State<ShtrixCodePage> createState() => _ShtrixCodePageState();
}

class _ShtrixCodePageState extends State<ShtrixCodePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductInfoState>(
      builder: (context, state) {
        // if(state.mxikAndShtrixCodeResponse == null){
        //   return
        // }
        return Scaffold(
          appBar: CustomAppBar(
            title: state.mxikAndShtrixCodeResponse != null?'Natija':'Shtrix kod orqali yuborish',
          ),
          body: state.mxikAndShtrixCodeResponse != null
              ? Column(
                  children: [
                    MxikCodeResponseWidget(
                        mxikAndShtrixCodeResponse:
                            state.mxikAndShtrixCodeResponse)
                  ],
                )
              : ModalProgressHUD(
                  inAsyncCall: state.isGettingProductDataByScanner,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shtrix kodni kiriting',
                            style: context.textStyle.regularTitle2
                                .copyWith(color: context.color?.primaryText)),
                        AppUtils.kGap4,
                        CustomTextField(
                          controller: controller,
                          hintText: '- - - - - - - - - - - - - -',
                          keyboardType: TextInputType.number,
                          inputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            onPressed: () {
                              context.read<ProductInfoBloc>().add(
                                  GetProductInfoByScannerEvent(
                                      onSuccess: () {},
                                      onError: () {},
                                      lang: 'uz_latin',
                                      internationalCode:
                                          controller.text.toString()));
                            },
                            icon: const Icon(Icons.search),
                          ),
                          onFieldSubmitted: (val) {
                            context.read<ProductInfoBloc>().add(
                                GetProductInfoByScannerEvent(
                                    onSuccess: () {},
                                    onError: () {},
                                    lang: 'uz_latin',
                                    internationalCode: val.toString()));
                          },
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}