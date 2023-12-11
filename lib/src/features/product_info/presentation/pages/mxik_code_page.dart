import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/mxik_and_shtrix_code_response.dart';

class MxikCodePage extends StatefulWidget {
  const MxikCodePage({super.key});

  @override
  State<MxikCodePage> createState() => _MxikCodePageState();
}

class _MxikCodePageState extends State<MxikCodePage> {
  bool isMoreClicked = false;

  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductInfoState>(
      builder: (context, state) {
        final data = state.mxikCodeResponse?.data;
        List<GoodAttr>? goodAttrs = [];
        if(state.mxikCodeResponse?.data.markingInfo.catalogData.isNotEmpty?? false){
          goodAttrs = state.mxikCodeResponse?.data.markingInfo.catalogData[0].goodAttrs;
        }
        return Scaffold(
          appBar: CustomAppBar(title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish'),
          body: ModalProgressHUD(
            inAsyncCall: state.isGettingProductDataByMxikCode,
            child: state.mxikCodeResponse != null?
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: (state.mxikCodeResponse?.data.mxikCode.isEmpty?? false)? Center(
                child:  Text('Hech qanday ma\'lumot topilmadi',style:context.textStyle.regularTitle2.copyWith(color: Colors.black),),
              ):SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                     '${(data?.markingInfo.catalogData.isNotEmpty??false)? data?.markingInfo.catalogData[0].productImageUrl:'https://storage.kun.uz/source/thumbnails/_medium/6/30l3u39OWfdYUrMPP6BgH6xPX4wo0fjW_medium.jpg'}' ,
                      width: Responsive.width(100, context),
                      height: Responsive.height(30, context),
                      fit: BoxFit.fill,
                    ),
                    item(context, 'Наименование товара', data?.markingInfo.productName??''),
                    (data?.markingInfo.catalogData.isNotEmpty?? false)?item(context, 'Название категории', data?.markingInfo.catalogData[0].categories[0].catName??''):Container(),
                    item(context, 'MXIK-код', data?.mxikCode??''),
                    item(context, 'Штрих-код', data?.mxikInfo.internationalCode??''),
                    isMoreClicked?Container():Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){
                        setState(() {
                          isMoreClicked = !isMoreClicked;
                        });
                      }, child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.keyboard_arrow_down),
                          Text('Ko\'proq ma\'lumot',style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor, fontSize: 14)),
                        ],
                      )),
                    ),
                    isMoreClicked? Column(
                      children: [
                        ...?goodAttrs?.map((cat) => item(context, cat.attrName, cat.attrValue??''))
                      ],
                    ): Container(),
                    isMoreClicked?Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(onPressed: (){
                        setState(() {
                          isMoreClicked = !isMoreClicked;
                        });
                      }, child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.keyboard_arrow_up),
                          Text('Berkitish',style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor, fontSize: 14)),
                        ],
                      )),
                    ): Container(),
                  ],
                ),
              ),
            ):
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mxik kodni kiriting'),
                  AppUtils.kGap4,
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    inputAction: TextInputAction.done,
                    controller: codeController,
                    hintText: '- - - - - - - - - - - - - - ',
                    onFieldSubmitted: (value) {
                      context.read<ProductInfoBloc>().add(
                        GetProductInfoByMxikCodeEvent(onSuccess: (){}, onError: (){}, lang: 'uz_latin', mxikCode: value)
                      );
                    },
                    suffixIcon: IconButton(
                        onPressed: () {
                          context.read<ProductInfoBloc>().add(
                              GetProductInfoByMxikCodeEvent(onSuccess: (){}, onError: (){}, lang: 'uz_latin', mxikCode: codeController.text.trim())
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

  Widget item(BuildContext context, String title, String desc){
    return Column(
      children: [
        title != 'Product nomi'?Divider(
          color: Colors.grey.shade200,
        ): Container(),
        AppUtils.kGap8,
        Row(
          children: [
            Expanded(child: Text(title,style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
            const SizedBox(width: 12,),
            Expanded(child: Text(desc,style: context.textStyle.regularBody, maxLines: 20,overflow: TextOverflow.ellipsis,))
          ],
        ),
      ],
    );
  }
}
