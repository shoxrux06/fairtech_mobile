import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/product_info_response.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class TnVedCodeResponseWidget extends StatefulWidget {
  final ProductInfoResponse? productInfoResponse;

  const TnVedCodeResponseWidget({
    super.key,
    required this.productInfoResponse
  });

  @override
  State<TnVedCodeResponseWidget> createState() => _TnVedCodeResponseWidgetState();
}

class _TnVedCodeResponseWidgetState extends State<TnVedCodeResponseWidget> {
  bool isMoreClicked = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.productInfoResponse?.data.length,
      itemBuilder: (context, index) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.productInfoResponse?.data[index].goods.length,
          itemBuilder: (context, i) {
            final productName = widget.productInfoResponse?.data[index].goods[i].productName;
            return InkWell(
              onTap: (){
                context.push(Routes.tnVedProductDetail,extra: widget.productInfoResponse?.data[index].goods[i]);
              },
              child: Container(
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text('Product name',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                        const SizedBox(width: 12,),
                        Expanded(
                          flex: 2,
                          child: Text('$productName', maxLines: 5,overflow: TextOverflow.ellipsis,style: context.textStyle.regularBody),
                        )
                      ],
                    ),
                    AppUtils.kGap8,
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text('Netto',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                        const SizedBox(width: 12,),
                        Expanded(
                            flex: 2,
                            child: Text('${widget.productInfoResponse?.data[index].goods[i].weightNetto}',style: context.textStyle.regularBody))
                      ],
                    ),
                    AppUtils.kGap8,
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text('Brutto',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                        const SizedBox(width: 12,),
                        Expanded(
                          flex: 2,
                          child: Text('${widget.productInfoResponse?.data[index].goods[i].brutto}',style: context.textStyle.regularBody),
                        )
                      ],
                    ),
                    AppUtils.kGap8,
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text('Olchov birligi',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                        const SizedBox(width: 12,),
                        Expanded(
                          flex: 2,
                          child: Text('${widget.productInfoResponse?.data[index].goods[i].addedUnitsMeasureName}',style: context.textStyle.regularBody),
                        )
                      ],
                    ),
                    AppUtils.kGap8,
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text('Ishlab chiqarilgan mamlakat',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))),
                        const SizedBox(width: 12,),
                        Expanded(
                          flex: 2,
                          child: Text('${widget.productInfoResponse?.data[index].goods[i].madeInCountryName}',style: context.textStyle.regularBody),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
