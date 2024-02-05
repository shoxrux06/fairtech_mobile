import 'dart:io';
import 'dart:typed_data';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/dynamic_link/dynamic_link.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/mxik_and_shtrix_code_response.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/widgets/carousel_widget.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/widgets/carousel_widget_string.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/widgets/no_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class   ShtrixCodePage extends StatefulWidget {
  const ShtrixCodePage({super.key, required this.code});

  final String code;

  @override
  State<ShtrixCodePage> createState() => _ShtrixCodePageState();
}

class _ShtrixCodePageState extends State<ShtrixCodePage> {
  final controller = TextEditingController();
  bool isMoreClicked = false;

  String code = '';

  ScreenshotController screenshotController = ScreenshotController();
  late File customFile;

  Future<void> widgetToImageFile(Uint8List capturedImage,) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    String path = '$tempPath/$ts.png';
    customFile = await File(path).writeAsBytes(capturedImage);
  }

  initFile() async {
    await screenshotController.captureFromWidget(Container(
      decoration: BoxDecoration(
          border: Border.all(
            color:Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(12),
      height: 150,
      child: SfBarcodeGenerator(value:code,showValue: true,),
    ),).then((capturedImage) async{
      widgetToImageFile(capturedImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductInfoState>(
      builder: (context, state) {
        final data = state.mxikAndShtrixCodeResponse?.data;
        List<CatalogDatum>? catalogDatum = [];
        List<GoodAttr>? goodAttr = [];
        List<Package>? packages = [];
        if(state.mxikAndShtrixCodeResponse?.data.markingInfo.catalogData.isNotEmpty?? false){
          catalogDatum = state.mxikAndShtrixCodeResponse?.data.markingInfo.catalogData;
        }
        if(state.mxikAndShtrixCodeResponse?.data.mxikInfo.packages.isNotEmpty?? false){
          packages = state.mxikAndShtrixCodeResponse?.data.mxikInfo.packages;
        }

        if(catalogDatum?.isNotEmpty?? false){
          catalogDatum?.forEach((element) {
            goodAttr.addAll(element.goodAttrs);
          });
        }

        if(state.mxikAndShtrixCodeResponse?.data.markingInfo.productName.isNotEmpty?? false){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikAndShtrixCodeResponse != null?'Natija': 'Mxik kod orqali yuborish', actions: state.mxikAndShtrixCodeResponse != null? [
              IconButton(onPressed: (){
                DynamicLinkProvider().createLink("dkfndwfs").then((value) =>  Share.share("${state.mxikAndShtrixCodeResponse?.data.mxikInfo.mxikName}\n$value\nShtrix-kod: $code"));
              }, icon: const Icon(Icons.share)),
              AppUtils.kGap8,
            ]:null,),
            body: ModalProgressHUD(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      (data?.markingInfo.catalogData.isNotEmpty??false)? CarouselWidget(catalog:data?.markingInfo.catalogData??[]):const NoImageWidget(),
                      item(context, 'Tovar nomi', data?.markingInfo.productName??''),
                      (data?.markingInfo.catalogData.isNotEmpty?? false)?item(context, 'Kategoriya nomi', data?.markingInfo.catalogData[0].categories[0].catName??''):Container(),
                      item(context, 'Shtrix kod', data?.mxikInfo.internationalCode??''),
                      item(context, 'Mxik kod', data?.mxikCode??''),
                      AppUtils.kGap12,
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade200,
                              )
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                              title: Text('Xususiyatlari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText,fontWeight: FontWeight.w700)),
                              children: [
                                Text('Ko\'proq ma\'lumot',style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor, fontSize: 14)),
                                ...goodAttr.map((cat) => item(context, cat.attrName, cat.attrValue??'')),
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
                                      SizedBox(
                                          height: 100,
                                          child: SfBarcodeGenerator(value: '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode}',showValue: true,)),
                                    ],
                                  ),
                                ),
                                AppUtils.kGap24
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
        } else if((state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode.isEmpty??false) && (state.mxikAndShtrixCodeResponse?.data.mxikCode.isNotEmpty??false)){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikAndShtrixCodeResponse != null?'Natija': 'Mxik kod orqali yuborish', actions: state.mxikAndShtrixCodeResponse != null?[
              IconButton(onPressed: (){
                DynamicLinkProvider().createLink("dkfndwfs").then((value) =>  Share.share("${state.mxikAndShtrixCodeResponse?.data.mxikInfo.mxikName}\n$value\nShtrix-kod: $code"));
              }, icon: const Icon(Icons.share)),
              AppUtils.kGap8,
            ]:null,),
            body: ModalProgressHUD(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      (data?.cardInfo.images.isNotEmpty??false)? CarouselWidgetString(images:data?.cardInfo.images??[]):NoImageWidget(),
                      item(context, 'Mxik kod', data?.mxikCode??''),
                      item(context, 'Mxik nomi', data?.mxikInfo.mxikName??''),
                      AppUtils.kGap12,
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade200,
                              )
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Text('Xususiyatlari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText,fontWeight: FontWeight.w700)),
                            children: [
                              (data?.markingInfo.catalogData.isNotEmpty?? false)?
                              item(context,  'Kategoriya nomi', data?.markingInfo.catalogData[0].categories[0].catName??''):Container(),
                              item(context, 'Guruh', data?.mxikInfo.groupName??''),
                              item(context, 'Sinf', data?.mxikInfo.className??''),
                              item(context, 'Pozitsiya', data?.mxikInfo.positionName??''),
                              item(context, 'SubPozitsiya', data?.mxikInfo.subPositionName??''),
                              AppUtils.kGap12,
                              Column(
                                children: [
                                  Text('Biriktirilgan o\'lchov birliklari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                                  AppUtils.kGap24,
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
                              )
                            ],
                          ),
                        ),
                      ),
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
                            SizedBox(
                                height: 100,
                                child: SfBarcodeGenerator(value: '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode}',showValue: true,)),
                          ],
                        ),
                      ),
                      AppUtils.kGap24
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        else if((state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode.isNotEmpty??false) && (state.mxikAndShtrixCodeResponse?.data.mxikCode.isEmpty??false)){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikAndShtrixCodeResponse != null?'Natija': 'Mxik kod orqali yuborish',actions: state.mxikAndShtrixCodeResponse != null? [
              IconButton(onPressed: (){
                DynamicLinkProvider().createLink("dkfndwfs").then((value) =>  Share.share("${state.mxikAndShtrixCodeResponse?.data.mxikInfo.mxikName}\n$value\nShtrix-kod: $code"));
              }, icon: const Icon(Icons.share)),
              AppUtils.kGap8,
            ]: null),
            body: ModalProgressHUD(
              inAsyncCall: state.isGettingProductDataByMxikCode,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (data?.cardInfo.images.isNotEmpty??false)? CarouselWidgetString(images:data?.cardInfo.images??[]):NoImageWidget(),
                      item2(context, 'Shtrix kod', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode}'),
                      item2(context, 'Mxik nomi', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.mxikName}'),
                      (state.mxikAndShtrixCodeResponse?.data.mxikInfo.packages.isNotEmpty?? false)? item2(context, 'Mxik kod', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.packages[0].mxikCode}'): Container(),
                      AppUtils.kGap12,
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade200,
                              )
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Text('Xususiyatlari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText,fontWeight: FontWeight.w700)),
                            children: [
                              item2(context, 'Guruh nomi', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.groupName}'),
                              item2(context, 'Brend nomi', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.brandName}'),
                              item2(context, 'Sinf nomi', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.className}'),
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
                                    SizedBox(height: 100,child: SfBarcodeGenerator(value: '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode}',showValue: true,)),
                                  ],
                                ),
                              ),
                              AppUtils.kGap24
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
        }else if((state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode.isNotEmpty??false)){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikAndShtrixCodeResponse != null?'Natija': 'Mxik kod orqali yuborish', actions: state.mxikAndShtrixCodeResponse != null?[
              IconButton(onPressed: (){
                DynamicLinkProvider().createLink("dkfndwfs").then((value) =>  Share.share("${state.mxikAndShtrixCodeResponse?.data.mxikInfo.mxikName}\n$value\nShtrix-kod: $code"));
              }, icon: const Icon(Icons.share)),
              AppUtils.kGap8,
            ]: null,),
            body: ModalProgressHUD(
              inAsyncCall: state.isGettingProductDataByMxikCode,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const NoImageWidget(),
                      item(context, 'Shtrix kod', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode}'),
                      item(context, 'Mxik nomi', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.mxikName}'),
                      (state.mxikAndShtrixCodeResponse?.data.mxikInfo.packages.isNotEmpty?? false)? item(context, 'Mxik kod', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.packages[0].mxikCode}'): Container(),
                      AppUtils.kGap12,
                      Theme(
                        data: ThemeData(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade200,
                              )
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Text('Xususiyatlari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText,fontWeight: FontWeight.w700)),
                            children: [
                              item(context, 'Guruh nomi', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.groupName}'),
                              item(context, 'Brend nomi', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.brandName}'),
                              item(context, 'Sinf nomi', '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.className}'),
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
                                    SizedBox(height: 100,child: SfBarcodeGenerator(value: '${state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode}',showValue: true,)),
                                  ],
                                ),
                              ),
                              AppUtils.kGap24
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
        } else if(state.mxikAndShtrixCodeResponse?.data.mxikCode.isEmpty??false){
          return Scaffold(
            appBar: CustomAppBar(title: state.mxikAndShtrixCodeResponse != null?'Natija': 'Mxik kod orqali yuborish'),
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
            appBar: CustomAppBar(
              title: state.mxikAndShtrixCodeResponse != null
                  ? 'Natija'
                  : 'Shtrix kod orqali yuborish',
            ),
            body:ModalProgressHUD(
              inAsyncCall: state.isGettingProductDataByScanner,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shtrix kodni kiriting',
                      style: context.textStyle.regularTitle2
                          .copyWith(color: context.color?.primaryText),
                    ),
                    AppUtils.kGap4,
                    CustomTextField(
                      controller: controller,
                      hintText: '- - - - - - - - - - - - - -',
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.done,
                      onChanged: (val){
                        code = val?.trim() ??'';
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          initFile();
                          context.read<ProductInfoBloc>().add(
                            GetProductInfoByScannerEvent(
                              context: context,
                              onSuccess: () {},
                              onError: () {
                                AppSnackBar.showErrorSnackBar(
                                  context,
                                  'Xatolik',
                                  'Server xatoligi yoki noto\'g\'ri so\'rov',
                                );
                              },
                              lang: 'uz_latin',
                              internationalCode:
                              controller.text.toString(),
                            ),
                          );
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        icon: const Icon(Icons.search),
                      ),
                      onFieldSubmitted: (val) {
                        initFile();
                        context.read<ProductInfoBloc>().add(
                          GetProductInfoByScannerEvent(
                            context: context,
                            onSuccess: () {},
                            onError: () {
                              AppSnackBar.showErrorSnackBar(
                                context,
                                'Xatolik',
                                'Server xatoligi yoki noto\'g\'ri so\'rov',
                              );
                            },
                            lang: 'uz_latin',
                            internationalCode: val.toString(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }


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
