import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  bool isSuccess = false;
  final codeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    fullData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductInfoBloc, ProductInfoState>(
      listener: (context, state){
        isSuccess = state.isSuccessProductDataByMxikCode;
      },
      builder: (context, state) {
        final data = state.mxikCodeResponse?.data;
        List<GoodAttr>? goodAttrs = [];
        List<Package>? packages = [];
        if(state.mxikCodeResponse?.data.markingInfo.catalogData.isNotEmpty?? false){
          goodAttrs = state.mxikCodeResponse?.data.markingInfo.catalogData[0].goodAttrs;
        }
        if(state.mxikCodeResponse?.data.mxikInfo.packages.isNotEmpty?? false){
          packages = state.mxikCodeResponse?.data.mxikInfo.packages;
        }
        if(state.mxikCodeResponse?.data.markingInfo.productName.isNotEmpty?? false){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish'),
            body: ModalProgressHUD(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      (data?.markingInfo.catalogData.isNotEmpty??false)?Image.network(
                        '${data?.markingInfo.catalogData[0].productImageUrl}' ,
                        width: Responsive.width(100, context),
                        height: Responsive.height(30, context),
                        fit: BoxFit.fill,
                      ):Image.asset(
                        AppConstants.noImage,
                        width: Responsive.width(100, context),
                        height: Responsive.height(30, context),
                        fit: BoxFit.fill,),
                      item(context, 'Наименование товара', data?.markingInfo.productName??''),
                      (data?.markingInfo.catalogData.isNotEmpty?? false)?item(context, 'Название категории', data?.markingInfo.catalogData[0].categories[0].catName??''):Container(),
                      item(context, 'MXIK-код', data?.mxikCode??''),
                      item(context, 'Штрих-код', data?.mxikInfo.internationalCode??''),
                      isMoreClicked? Container():Align(
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
              ),
            ),
          );
        }else if((state.mxikCodeResponse?.data.mxikInfo.internationalCode.isEmpty??false) && (state.mxikCodeResponse?.data.mxikCode.isNotEmpty??false)){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish'),
            body: ModalProgressHUD(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      item(context, 'Mxik nomi', data?.mxikInfo.mxikName??''),
                      (data?.markingInfo.catalogData.isNotEmpty?? false)?item(context, 'Название категории', data?.markingInfo.catalogData[0].categories[0].catName??''):Container(),
                      item(context, 'Mxik kod', data?.mxikCode??''),
                      item(context, 'Guruh', data?.mxikInfo.groupName??''),
                      item(context, 'Sinf', data?.mxikInfo.className??''),
                      item(context, 'Pozitsiya', data?.mxikInfo.positionName??''),
                      item(context, 'SubPozitsiya', data?.mxikInfo.subPositionName??''),
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
                      AppUtils.kGap24,
                      isMoreClicked? Column(
                        children: [
                          Text('Biriktirilgan o\'lchov birliklari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                          AppUtils.kGap24,
                          ...?packages?.map((pack) => Container(
                            padding: EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(vertical: 6),
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
                                AppUtils.kGap8,
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
              ),
            ),
          );
        }
        else if((state.mxikCodeResponse?.data.mxikInfo.internationalCode.isNotEmpty??false) && (state.mxikCodeResponse?.data.mxikCode.isEmpty??false)){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish'),
            body: ModalProgressHUD(
              inAsyncCall: state.isGettingProductDataByMxikCode,
              child: Container(
                padding: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppConstants.noImage,
                        width: Responsive.width(70, context),
                        height: Responsive.height(20, context),
                        fit: BoxFit.fill,
                      ),
                      item2(context, 'Mxik nomi', '${state.mxikCodeResponse?.data.mxikInfo.mxikName}'),
                      item2(context, 'Guruh nomi', '${state.mxikCodeResponse?.data.mxikInfo.groupName}'),
                      item2(context, 'Brend nomi', '${state.mxikCodeResponse?.data.mxikInfo.brandName}'),
                      item2(context, 'Sinf nomi', '${state.mxikCodeResponse?.data.mxikInfo.className}'),
                      item2(context, 'Shtrix kod', '${state.mxikCodeResponse?.data.mxikInfo.internationalCode}'),
                      (state.mxikCodeResponse?.data.mxikInfo.packages.isNotEmpty?? false)? item2(context, 'Mxik kod', '${state.mxikCodeResponse?.data.mxikInfo.packages[0].mxikCode}'): Container()
                    ],
                  ),
                ),
              ),
            ),
          );
        }else if((state.mxikCodeResponse?.data.mxikInfo.internationalCode.isNotEmpty??false)){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikCodeResponse != null?'Natija': 'Mxik kod orqali yuborish'),
            body: ModalProgressHUD(
              inAsyncCall: state.isGettingProductDataByMxikCode,
              child: Container(
                padding: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppConstants.noImage,
                        width: Responsive.width(70, context),
                        height: Responsive.height(20, context),
                        fit: BoxFit.fill,
                      ),
                      item(context, 'Mxik nomi', '${state.mxikCodeResponse?.data.mxikInfo.mxikName}'),
                      item(context, 'Guruh nomi', '${state.mxikCodeResponse?.data.mxikInfo.groupName}'),
                      item(context, 'Brend nomi', '${state.mxikCodeResponse?.data.mxikInfo.brandName}'),
                      item(context, 'Sinf nomi', '${state.mxikCodeResponse?.data.mxikInfo.className}'),
                      item(context, 'Shtrix kod', '${state.mxikCodeResponse?.data.mxikInfo.internationalCode}'),
                      (state.mxikCodeResponse?.data.mxikInfo.packages.isNotEmpty?? false)? item(context, 'Mxik kod', '${state.mxikCodeResponse?.data.mxikInfo.packages[0].mxikCode}'): Container()
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
