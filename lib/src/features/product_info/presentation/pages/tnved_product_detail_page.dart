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
  bool isMoreClicked = false;

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
              isMoreClicked?Container():Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){
                  setState(() {
                    isMoreClicked = !isMoreClicked;
                  });
                }, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.keyboard_arrow_down),
                    Text('Ko\'proq ma\'lumot',style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor, fontSize: 14)),
                  ],
                )),
              ),
              isMoreClicked? Column(
                children: [
                  item(context, 'TnVed kod', widget.good.tnCode),
                  item(context, 'Tovar raqami', widget.good.numberCommodity),
                  item(context, 'Qo\'shilgan birliklar o\'lchov nomi', widget.good.addedUnitsMeasureName),
                  item(context, 'Qo\'shilgan birliklar o\'lchovi', widget.good.addedUnitsMeasure),
                  item(context, 'Qo\'shilgan miqdor', widget.good.addedQuantity.toString()),
                  item(context, 'Imtiyozlar miqdori 20', widget.good.amountBenefits20.toString()),
                  item(context, 'Imtiyozlar miqdori 27', widget.good.amountBenefits27.toString()),
                  item(context, 'Imtiyozlar miqdori 29', widget.good.amountBenefits29.toString()),
                  item(context, 'Jami imtiyozlar', widget.good.totalBenefits.toString()),
                  item(context, 'Mahsulot xarakteri ', widget.good.characteristicProduct.toString()),
                  item(context, 'To\'lovlar miqdori 20', widget.good.amountPayments20.toString()),
                  item(context, 'To\'lovlar miqdori 27', widget.good.amountPayments27.toString()),
                  item(context, 'To\'lovlar miqdori 29', widget.good.amountPayments29.toString()),
                  item(context, 'Jami to\'lovlar', widget.good.totalPayments.toString()),
                  item(context, 'Hisob-faktura qiymati', widget.good.invoiceValue.toString()),
                  item(context, 'Statistik qiymat', widget.good.statisticalValue.toString()),
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
