import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/mxik_and_shtrix_code_response.dart';
import 'package:flutter/material.dart';


class ShtrixCodeResponseWidget extends StatefulWidget {
  final MxikAndShtrixCodeResponse? mxikAndShtrixCodeResponse;

  const ShtrixCodeResponseWidget({
    super.key,
    required this.mxikAndShtrixCodeResponse
  });

  @override
  State<ShtrixCodeResponseWidget> createState() => _ShtrixCodeResponseWidgetState();
}

class _ShtrixCodeResponseWidgetState extends State<ShtrixCodeResponseWidget> {
  bool isMoreClicked = false;
  @override
  Widget build(BuildContext context) {
    List<GoodAttr>? goodAttrs = [];
    if(widget.mxikAndShtrixCodeResponse?.data.markingInfo.catalogData.isNotEmpty?? false){
      goodAttrs = widget.mxikAndShtrixCodeResponse?.data.markingInfo.catalogData[0].goodAttrs;
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text('Tovar xarakteristikasi'),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black54,
                  width: 1
              ),
              borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text('Mxik',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                  const SizedBox(width: 12,),
                  Expanded(
                    flex: 2,
                    child: Text('${widget.mxikAndShtrixCodeResponse?.data.mxikCode}', maxLines: 2,overflow: TextOverflow.ellipsis,style: context.textStyle.regularBody),
                  )
                ],
              ),
              AppUtils.kGap8,
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text('Mahsulot nomi',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                  const SizedBox(width: 12,),
                  Expanded(
                    flex: 2,
                    child: Text('${widget.mxikAndShtrixCodeResponse?.data.mxikInfo.subPositionName}', maxLines: 2,overflow: TextOverflow.ellipsis,style: context.textStyle.regularBody),
                  )
                ],
              ),
              AppUtils.kGap8,
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text('Shtrix kod',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                      flex: 2,
                      child: Text('${widget.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode}',style: context.textStyle.regularBody))
                ],
              ),
              AppUtils.kGap12,
            ],
          ),
        ),
        AppUtils.kGap12,
        if (goodAttrs?.isEmpty?? false) Container() else Column(
          children: [
            isMoreClicked?Container():Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){
                  setState(() {
                    isMoreClicked = !isMoreClicked;
                  });
                }, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.keyboard_arrow_down,color: Colors.black),
                    Text('Ko\'proq ma\'lumot',style: context.textStyle.largeTitle2.copyWith(color: Colors.black, fontSize: 14)),
                  ],
                )),
              ),
            ),
            isMoreClicked? Text('Tovar haqida batafsil ma\'lumot'): Container(),
            isMoreClicked?AppUtils.kGap12: Container(),
            isMoreClicked? Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black54,
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...?goodAttrs?.map((cat) => item(cat.attrName, cat.attrValue??''))
                  ],
                ),
              ),
            ):Container(),
            isMoreClicked?Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: (){
                  setState(() {
                    isMoreClicked = !isMoreClicked;
                  });
                }, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.keyboard_arrow_up,color: Colors.black),
                    Text('Berkitish',style: context.textStyle.largeTitle2.copyWith(color: Colors.black, fontSize: 14)),
                  ],
                )),
              ),
            ): Container(),
          ],
        )
      ],
    );
  }
  
  Widget item(String title, String desc){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(title,style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))
          ),
          const SizedBox(width: 12,),
          Expanded(
              flex: 2,
              child: Text(desc,style: context.textStyle.regularBody)
          )
        ],
      ),
    );
  }
}
