import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/data/models/product_info_response.dart';
import 'package:flutter/material.dart';


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
            return Container(
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
                      const Text('Product name'),
                      const SizedBox(width: 12,),
                      Expanded(child: Text('${widget.productInfoResponse?.data[index].goods[i].productName}', maxLines: 3,overflow: TextOverflow.ellipsis,),
                      )
                    ],
                  ),
                  AppUtils.kGap8,
                  Row(
                    children: [
                      const Expanded(child: Text('Netto')),
                      const SizedBox(width: 12,),
                      Text('${widget.productInfoResponse?.data[index].goods[i].weightNetto}')
                    ],
                  ),
                  AppUtils.kGap8,
                  Row(
                    children: [
                      const Expanded(child: Text('Brutto')),
                      const SizedBox(width: 12,),
                      Expanded(child: Text('${widget.productInfoResponse?.data[index].goods[i].brutto}'),
                      )
                    ],
                  ),
                  AppUtils.kGap8,
                  Row(
                    children: [
                      const Text('Olchov birligi'),
                      const SizedBox(width: 12,),
                      Expanded(child: Text('${widget.productInfoResponse?.data[index].goods[i].addedUnitsMeasureName}'),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(child: Text('Ishlab chiqarilgan mamlakat')),
                      const SizedBox(width: 12,),
                      Expanded(child: Text('${widget.productInfoResponse?.data[index].goods[i].madeInCountryName}'),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
