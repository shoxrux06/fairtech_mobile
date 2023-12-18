import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/mxik_and_shtrix_code_response.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({super.key, required this.mxikAndShtrixCodeResponse});

  final MxikAndShtrixCodeResponse? mxikAndShtrixCodeResponse;
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

  getInfo(){
    data = widget.mxikAndShtrixCodeResponse?.data;
    mxikInfo = widget.mxikAndShtrixCodeResponse?.data.mxikInfo;
    if(mxikInfo?.packages.isNotEmpty?? false){
      packages = mxikInfo?.packages;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppUtils.kGap40,
        AppUtils.kGap40,
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                customListTile(Icons.local_drink, 'Tovar nomi', mxikInfo?.className ?? '---'),
                customListTile(Icons.document_scanner, 'Shtrix-kodi', mxikInfo?.internationalCode ?? '---'),
                customListTile(Icons.branding_watermark, 'Brend', mxikInfo?.brandName ?? '---'),
                customListTile(Icons.confirmation_number_sharp, 'MXIK', data?.mxikCode ?? '---'),
                customListTile(Icons.info, 'Tovar tavsifi', mxikInfo?.subPositionName ?? '---'),
                isMoreClicked?Container():Align(
                  alignment: Alignment.center,
                  child: TextButton(onPressed: (){
                    setState(() {
                      isMoreClicked = !isMoreClicked;
                    });
                    context.read<ProductInfoBloc>().add(
                        GetProductInfoByMxikCodeEvent(context: context,onSuccess: (){}, onError: (){}, lang: 'uz_latin', mxikCode: '${data?.mxikCode}')
                    );
                  }, child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.keyboard_arrow_down),
                      Text('Ko\'proq ma\'lumot',style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor, fontSize: 14)),
                    ],
                  )),
                ),
                AppUtils.kGap12,
                isMoreClicked? Column(
                  children: [
                    Text('Biriktirilgan o\'lchov birliklari',style: context.textStyle.regularTitle2.copyWith(color: context.theme.primaryColor)),
                    AppUtils.kGap24,
                    ...?packages?.map((pack) => Container(
                      padding: EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade100,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text('O\'lchov birligi',style: context.textStyle.regularTitle2.copyWith(color: context.theme.primaryColor))),
                              const SizedBox(width: 12,),
                              Expanded(child: Text(pack.packageName ?? '---',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor), maxLines: 20,overflow: TextOverflow.ellipsis,))
                            ],
                          ),
                          AppUtils.kGap8,
                          Row(
                            children: [
                              Expanded(child: Text('Kod',style: context.textStyle.regularTitle2.copyWith(color: context.theme.primaryColor))),
                              const SizedBox(width: 12,),
                              Expanded(child: Text('${pack.packageCode ?? '---'}',style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor), maxLines: 20,overflow: TextOverflow.ellipsis,))
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ): Container(),
                isMoreClicked?Align(
                  alignment: Alignment.center,
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

      ],
    );
  }

  Widget customListTile(IconData icon, String title, String subTitle){
    return Column(
      children: [
        ListTile(
          leading: Icon(icon,color: context.theme.primaryColor),
          title: Text(title,style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontSize: 14)),
          subtitle: Text(subTitle,style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),),
        ),
        const Divider(
          height: 1,
          color: Colors.black12,
        ),
      ],
    );
  }
}
