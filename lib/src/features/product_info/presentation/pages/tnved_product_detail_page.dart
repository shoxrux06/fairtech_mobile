import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/product_info_response.dart';
import 'package:flutter/material.dart';

class TnVedProductDetailPage extends StatefulWidget {
  const TnVedProductDetailPage({super.key, required this.good});

  final Good good;

  @override
  State<TnVedProductDetailPage> createState() => _TnVedProductDetailPageState();
}

class _TnVedProductDetailPageState extends State<TnVedProductDetailPage> {

  @override
  Widget build(BuildContext context) {
    final productName = widget.good.productName;

    return Scaffold(
      appBar: CustomAppBar(title: productName),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
              item(context, 'Product nomi', productName.substring(0, productName.indexOf('вес'))),
              item(context, 'Netto', widget.good.weightNetto.toString()),
              item(context, 'Brutto', widget.good.brutto.toString()),
              item(context, 'O\'lchov birligi', widget.good.addedUnitsMeasureName),
              item(context, 'Ishlab chiqarilgan mamlakat', widget.good.madeInCountryName),
            ],
          ),
        ),
      ),
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
