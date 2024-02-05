import 'dart:io';
import 'dart:typed_data';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/mxik_and_shtrix_code_response.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/widgets/no_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({super.key, required this.mxikAndShtrixCodeResponse, required this.code});

  final MxikAndShtrixCodeResponse? mxikAndShtrixCodeResponse;
  final String code;
  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  bool isMoreClicked = false;

  List<Package>? packages = [];
  MxikInfo? mxikInfo;
  Data? data;

  @override
  void initState() {
    // TODO: implement initState
    getInfo();
    super.initState();
  }

  getInfo() {
    data = widget.mxikAndShtrixCodeResponse?.data;
    mxikInfo = widget.mxikAndShtrixCodeResponse?.data.mxikInfo;
    if(mxikInfo?.packages.isNotEmpty?? false){
      packages = mxikInfo?.packages;
    }
  }


  @override
  Widget build(BuildContext context) {
    print('Code **${widget.code} **');
    return Column(
      children: [
        AppUtils.kGap40,
        AppUtils.kGap40,
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const NoImageWidget(),
                  customListTile('Shtrix-kod', mxikInfo?.internationalCode ?? '---'),
                  customListTile('Tovar nomi', mxikInfo?.className ?? '---'),
                  customListTile('Mxik-kod', data?.mxikCode ?? '---'),
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
                        title: Text('Xususiyatlari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText,fontWeight: FontWeight.w700)),
                        children: [
                          customListTile('Brend', mxikInfo?.brandName ?? '---'),
                          customListTile('Tovar tavsifi', mxikInfo?.subPositionName ?? '---'),
                          AppUtils.kGap12,
                          Column(
                            children: [
                              Text('Biriktirilgan o\'lchov birliklari',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                              AppUtils.kGap12,
                              ...?packages?.map((pack) => Container(
                                padding: const EdgeInsets.all(12),
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
                                        Expanded(child: Text(pack.packageName ?? '---',style: context.textStyle.regularBody.copyWith(color: context.color?.primaryText), maxLines: 20,overflow: TextOverflow.ellipsis,))
                                      ],
                                    ),
                                    Divider(color: Colors.grey.shade300,),
                                    Row(
                                      children: [
                                        Expanded(child: Text('Kod',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                                        const SizedBox(width: 12,),
                                        Expanded(child: Text('${pack.packageCode ?? '---'}',style: context.textStyle.regularBody.copyWith(color: context.color?.primaryText), maxLines: 20,overflow: TextOverflow.ellipsis,))
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                            ],
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
                                SizedBox(height: 100,child: SfBarcodeGenerator(value: '${mxikInfo?.internationalCode}',showValue: true,)),
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

      ],
    );
  }

  Widget customListTile(String title, String subTitle){
    return Column(
      children: [
        Divider(
          color: Colors.grey.shade200,
        ),
        AppUtils.kGap8,
        Row(
          children: [
            Expanded(child: Text(title,style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
            const SizedBox(width: 12,),
            Expanded(child: Text(subTitle,style: context.textStyle.regularBody, maxLines: 20,overflow: TextOverflow.ellipsis,))
          ],
        ),
      ],
    );
  }
}
