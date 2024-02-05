import 'package:carousel_slider/carousel_slider.dart';
import 'package:fairtech_mobile/src/core/dynamic_link/dynamic_link.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/widgets/carousel_widget.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/widgets/carousel_widget_string.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/widgets/no_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../../core/constants/app_constants.dart';
import '../../data/models/mxik_and_shtrix_code_response.dart';

class MxikCodePage extends StatefulWidget {
  const MxikCodePage({super.key, this.product,this.service});

  final String? product;
  final String? service;
  @override
  State<MxikCodePage> createState() => _MxikCodePageState();
}

class _MxikCodePageState extends State<MxikCodePage> {
  final List<String> list = [];
  fullData(){
    for(int i = 1;i<99;i++){
      if(i< 10){
        list.add('00$i');
      }else if(i >=10 && i < 99){
        list.add('0$i');
      }
    }
  }

  bool isMoreClicked = false;

  final codeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    fullData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductInfoState>(
      builder: (context, state) {
        final data = state.mxikCodeResponse?.data;
        List<CatalogDatum>? catalogDatum = [];
        List<GoodAttr>? goodAttr = [];
        List<Package>? packages = [];
        if(state.mxikCodeResponse?.data.markingInfo.catalogData.isNotEmpty?? false){
          catalogDatum = state.mxikCodeResponse?.data.markingInfo.catalogData;
        }
        if(state.mxikCodeResponse?.data.mxikInfo.packages.isNotEmpty?? false){
          packages = state.mxikCodeResponse?.data.mxikInfo.packages;
        }

        if(catalogDatum?.isNotEmpty?? false){
          catalogDatum?.forEach((element) {
            goodAttr.addAll(element.goodAttrs);
          });
        }

        if(state.mxikCodeResponse?.data.markingInfo.productName.isNotEmpty?? false){
          return Scaffold(
            appBar: CustomAppBar(
                title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish',
              actions: state.mxikCodeResponse != null?[
                IconButton(
                    onPressed: (){
                      DynamicLinkProvider().createLink('sdsmdks3421').then((value) =>
                          Share.share('${state.mxikCodeResponse?.data.mxikInfo.mxikName}\n$value\nMxik-kod: ${state.mxikCodeResponse?.data.mxikCode}')
                      );
                    }, icon: const Icon(Icons.share)
                ),
              ]: null,
            ),
            body: ModalProgressHUD(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      (data?.markingInfo.catalogData.isNotEmpty??false)? CarouselWidget(catalog:data?.markingInfo.catalogData??[]):const NoImageWidget(),
                      item(context, 'Tovar nomi', data?.markingInfo.productName??''),
                      (data?.markingInfo.catalogData.isNotEmpty?? false)?item(context, 'Kategoriya nomi', data?.markingInfo.catalogData[0].categories[0].catName??''):Container(),
                      item(context, 'Mxik kod', data?.mxikCode??''),
                      item(context, 'Shtrix kod', data?.mxikInfo.internationalCode??''),
                      AppUtils.kGap12,
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey,
                              )
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          title: Text('Xususiyatlari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText, fontWeight: FontWeight.w700)),
                          children: [
                            Text('Atributlari',style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor, fontSize: 14)),
                            ...goodAttr.map((cat) => item(context, cat.attrName, cat.attrValue??''))
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        else if((state.mxikCodeResponse?.data.mxikInfo.internationalCode.isEmpty??false) && (state.mxikCodeResponse?.data.mxikCode.isNotEmpty??false)){
          return Scaffold(
            appBar: CustomAppBar(
              title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish',
              actions: state.mxikCodeResponse != null?[
                IconButton(
                    onPressed: (){
                      DynamicLinkProvider().createLink('sdsmdks3421').then((value) =>
                          Share.share('${state.mxikCodeResponse?.data.mxikInfo.mxikName}\n$value\nMxik-kod: ${state.mxikCodeResponse?.data.mxikCode}')
                      );
                    }, icon: const Icon(Icons.share)
                ),
              ]: null,
            ),
            body: ModalProgressHUD(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      (data?.cardInfo.images.isNotEmpty??false)? CarouselWidgetString(images:data?.cardInfo.images??[]):NoImageWidget(),
                      item(context, 'Mxik kod', data?.mxikCode??''),
                      item(context, 'Mxik nomi', data?.mxikInfo.mxikName??''),
                      AppUtils.kGap24,
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade100,
                            )
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Text('Xususiyalatlari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText, fontWeight: FontWeight.w700)),
                            children: [
                            (data?.markingInfo.catalogData.isNotEmpty?? false)?
                            item(context, 'Kategoriya nomi', data?.markingInfo.catalogData[0].categories[0].catName??''):Container(),
                            item(context, 'Guruh', data?.mxikInfo.groupName??''),
                            item(context, 'Sinf', data?.mxikInfo.className??''),
                            item(context, 'Pozitsiya', data?.mxikInfo.positionName??''),
                            item(context, 'SubPozitsiya', data?.mxikInfo.subPositionName??''),
                              AppUtils.kGap12,
                              Column(
                                children: [
                                  Text('Biriktirilgan o\'lchov birliklari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                                  AppUtils.kGap12,
                                  ...?packages?.map((pack) => Container(
                                    padding: EdgeInsets.all(12),
                                    margin: EdgeInsets.only(bottom: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey.shade100,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(child: Text('O\'lchov birligi',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                                            const SizedBox(width: 12,),
                                            Expanded(child: Text(pack.packageName,style: context.textStyle.regularBody, maxLines: 20,overflow: TextOverflow.ellipsis,))
                                          ],
                                        ),
                                        Divider(color: Colors.grey.shade300,),
                                        Row(
                                          children: [
                                            Expanded(child: Text('Kod',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                                            const SizedBox(width: 12,),
                                            Expanded(child: Text('${pack.packageCode}',style: context.textStyle.regularBody, maxLines: 20,overflow: TextOverflow.ellipsis,))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                              AppUtils.kGap12,
                          ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        }
        else if((state.mxikCodeResponse?.data.mxikInfo.internationalCode.isNotEmpty??false) && (state.mxikCodeResponse?.data.mxikCode.isEmpty??false)){
          return Scaffold(
            appBar: CustomAppBar(
              title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish',
              actions: state.mxikCodeResponse != null?[
                IconButton(
                    onPressed: (){
                      DynamicLinkProvider().createLink('sdsmdks3421').then((value) =>
                          Share.share('${state.mxikCodeResponse?.data.mxikInfo.mxikName}\n$value\nMxik-kod: ${state.mxikCodeResponse?.data.mxikCode}')
                      );
                    }, icon: const Icon(Icons.share)
                ),
              ]: null,
            ),
            body: ModalProgressHUD(
              inAsyncCall: state.isGettingProductDataByMxikCode,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (data?.cardInfo.images.isNotEmpty??false)? CarouselWidgetString(images:data?.cardInfo.images??[]):NoImageWidget(),
                      (state.mxikCodeResponse?.data.mxikInfo.packages.isNotEmpty?? false)? item2(context, 'Mxik kod', '${state.mxikCodeResponse?.data.mxikInfo.packages[0].mxikCode}'): Container(),
                      item2(context, 'Mxik nomi', '${state.mxikCodeResponse?.data.mxikInfo.mxikName}'),
                      item2(context, 'Shtrix kod', '${state.mxikCodeResponse?.data.mxikInfo.internationalCode}'),
                      AppUtils.kGap12,
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade100,
                              )
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12
                          ),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          title: Text('Xususiyatlari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText, fontWeight: FontWeight.w700)), children: [
                          item2(context, 'Guruh nomi', '${state.mxikCodeResponse?.data.mxikInfo.groupName}'),
                          item2(context, 'Brend nomi', '${state.mxikCodeResponse?.data.mxikInfo.brandName}'),
                          item2(context, 'Sinf nomi', '${state.mxikCodeResponse?.data.mxikInfo.className}'),
                        ],),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          );
        }else if((state.mxikCodeResponse?.data.mxikInfo.internationalCode.isNotEmpty??false)){
          return Scaffold(
            appBar: CustomAppBar(
              title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish',
              actions: state.mxikCodeResponse != null?[
                IconButton(
                    onPressed: (){
                      DynamicLinkProvider().createLink('sdsmdks3421').then((value) =>
                          Share.share('${state.mxikCodeResponse?.data.mxikInfo.mxikName}\n$value\nMxik-kod: ${state.mxikCodeResponse?.data.mxikCode}')
                      );
                    }, icon: const Icon(Icons.share)
                ),
              ]: null,
            ),
            body: ModalProgressHUD(
              inAsyncCall: state.isGettingProductDataByMxikCode,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const NoImageWidget(),
                      (state.mxikCodeResponse?.data.mxikInfo.packages.isNotEmpty?? false)? item(context, 'Mxik kod', '${state.mxikCodeResponse?.data.mxikInfo.packages[0].mxikCode}'): Container(),
                      item(context, 'Mxik nomi', '${state.mxikCodeResponse?.data.mxikInfo.mxikName}'),
                      item(context, 'Shtrix kod', '${state.mxikCodeResponse?.data.mxikInfo.internationalCode}'),
                      AppUtils.kGap12,
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey,
                              )
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          title: Text('Xususiyatlari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText, fontWeight: FontWeight.w700)),
                          children: [
                          item(context, 'Guruh nomi', '${state.mxikCodeResponse?.data.mxikInfo.groupName}'),
                          item(context, 'Brend nomi', '${state.mxikCodeResponse?.data.mxikInfo.brandName}'),
                          item(context, 'Sinf nomi', '${state.mxikCodeResponse?.data.mxikInfo.className}'),
                            AppUtils.kGap12,
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:Colors.grey.shade200,
                                  ),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                children: [
                                  Row(children: [
                                    Image.asset(AppConstants.barcodePng, width: 24, height: 24,),
                                    AppUtils.kGap4,
                                    const Text('Tovar shtrix-kodi'),
                                    AppUtils.kGap12,
                                  ],),
                                  AppUtils.kGap12,
                                  SizedBox(height: 100,child: SfBarcodeGenerator(value: '${state.mxikCodeResponse?.data.mxikInfo.internationalCode}',showValue: true,)),
                                ],
                              ),
                            ),
                            AppUtils.kGap24
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if(state.mxikCodeResponse?.data.mxikCode.isEmpty??false){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish'),
            body: ModalProgressHUD(
              inAsyncCall: state.isGettingProductDataByMxikCode,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(child: Text('Tanlangan mahsulot "Milliy tasnif" da ro\'yxatdan o\'tmagan',style:context.textStyle.regularTitle2.copyWith(color: Colors.black),textAlign: TextAlign.center,)),
              ),
            ),
          );
        }else{
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish'),
            body:ModalProgressHUD(
              inAsyncCall: state.isGettingProductDataByMxikCode,
              child: Padding(
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
                      hintText: '- - - - - - - - - - - - - - - - -',
                      onFieldSubmitted: (value) {
                        bool isHas = false;
                      if(value.length == 17){
                        String hasValue = value.substring(0,3);
                          for (var element in list) {
                            if(hasValue == element){
                              isHas = true;
                            }
                          }
                          if(isHas){
                            context.read<ProductInfoBloc>().add(
                                GetProductInfoByMxikCodeEvent(context:context,onSuccess: (){}, onError: (){
                                  AppSnackBar.showErrorSnackBar(context, 'Xatolik', 'Server xatoligi yoki noto\'g\'ri so\'rov');
                                }, lang: 'uz_latin', mxikCode: value)
                            );
                          }else{
                            AppSnackBar.showWarningSnackBar(context, ' "Ish (xizmatlar)" to\'g\'risida ma\'lumot qismida tekshiring, siz kiritgan MXIK kod tovarlarga tegishli emas!!!');
                          }
                        }else{
                          AppSnackBar.showWarningSnackBar(context, 'Mxik kod noto\'g\'ri kiritilgan');
                        }
                      },
                      suffixIcon: IconButton(
                          onPressed: () {
                            bool isHas = false;
                            if(codeController.text.length == 17){
                              String hasValue = codeController.text.substring(0,3);
                              for (var element in list) {
                                if(hasValue == element){
                                  isHas = true;
                                }
                              }
                              if(isHas){
                                context.read<ProductInfoBloc>().add(
                                    GetProductInfoByMxikCodeEvent(context:context,onSuccess: (){}, onError: (){
                                      AppSnackBar.showErrorSnackBar(context, 'Xatolik', 'Server xatoligi yoki noto\'g\'ri so\'rov');
                                    }, lang: 'uz_latin', mxikCode: codeController.text)
                                );
                              }else{
                                AppSnackBar.showWarningSnackBar(context, ' "Ish (xizmatlar)" to\'g\'risida ma\'lumot qismida tekshiring, siz kiritgan MXIK kod tovarlarga tegishli emas!!!');
                              }
                            }else{
                              AppSnackBar.showWarningSnackBar(context, 'Mxik kod noto\'g\'ri kiritilgan');
                            }
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          icon: const Icon(Icons.search)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
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

  Widget item2(BuildContext context, String title, String desc){
    return Row(
      children: [
        Expanded(child: Text(title,style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
        const SizedBox(width: 12,),
        Expanded(child: Text(desc,style: context.textStyle.regularBody, maxLines: 20,overflow: TextOverflow.ellipsis,))
      ],
    );
  }

}
