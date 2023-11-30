import 'package:cached_network_image/cached_network_image.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({super.key});

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  String imgUrl =
      'https://storage.kun.uz/source/7/kbM87woJPO9r4hxDNcirjUQeO-3ySJnJ.jpg';

  bool isMoreClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppUtils.kGap40,
        AppUtils.kGap40,
        CachedNetworkImage(
          placeholder:(context,url) => Image.asset("assets/images/placeholder.jpg"),
          imageUrl: imgUrl,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                customListTile(Icons.local_drink, 'productName', 'Coco cola'),
                customListTile(Icons.document_scanner, 'productBarcode', '123456654321'),
                customListTile(Icons.branding_watermark, 'productBrand', '123456654321'),
                customListTile(Icons.confirmation_number_sharp, 'MXIK', '123456654321'),
                customListTile(Icons.confirmation_number_sharp, 'TNVED', '123456654321'),
                customListTile(Icons.info, 'prodcutDescription', '123456654321'),
                isMoreClicked?Container():Align(
                  alignment: Alignment.center,
                  child: TextButton(onPressed: (){
                    setState(() {
                      isMoreClicked = !isMoreClicked;
                    });
                  }, child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.keyboard_arrow_down),
                      Text('More info',style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor, fontSize: 14)),
                    ],
                  )),
                ),
                isMoreClicked?Column(
                  children: [
                    customListTile(Icons.document_scanner, 'volumeFractionEthylAlcohol', '4'),
                    customListTile(Icons.document_scanner, 'energyValue', '38'),
                    customListTile(Icons.date_range, 'bestBeforeDate', '6'),
                    customListTile(Icons.no_adult_content, 'isItFlavored', 'Нет'),
                    customListTile(Icons.ac_unit_outlined, 'recommendationsForUse', 'в холодном виде'),
                    customListTile(Icons.grade, 'minRelativeHumidity', '+5 C'),
                    customListTile(Icons.percent, 'maxTemperature', '70%'),
                    customListTile(Icons.no_adult_content, 'containsGMOs', 'Нет'),
                    customListTile(Icons.height, 'height', '17'),
                    customListTile(Icons.deblur, 'depth', '6.2'),
                    customListTile(Icons.width_full, 'width', '6.2'),
                    customListTile(Icons.grid_on_sharp, 'grossWeight', '60.43'),
                    customListTile(Icons.restore_from_trash_rounded, 'tradeNameProduct', 'Пиво светлое фильтрованное ASIA STANDARD 4% 0.45л'),
                    customListTile(Icons.compare, 'compound', 'солод, хмель, вода.'),
                    customListTile(Icons.barcode_reader, 'typeOfPackaging', 'Баночка'),
                    customListTile(Icons.pan_tool_alt, 'packagingMaterial', 'Алюминий'),
                    customListTile(Icons.face, 'precautionaryMeasures', 'Алкоголь противопоказан лицам, не достигшим 21 года, беременным и кормящим женщинам, лицам с заболеваниями центральной нервной системы, почек, печени и органов пищеварения'),
                    customListTile(Icons.ac_unit_outlined, 'standardNumber', '31711-2012'),
                    customListTile(Icons.countertops, 'countryOfOrigin', 'Узбекистан'),
                    customListTile(Icons.percent, 'maxRelativeHumidity', '75%'),
                    customListTile(Icons.dark_mode, 'specialStorageConditions', 'в тени'),
                    customListTile(Icons.no_adult_content, 'marketCirculationSign', 'Нет'),
                    customListTile(Icons.map, 'netMeasure', '0.45'),
                    customListTile(Icons.line_axis, 'processingMethod', 'Пастеризованное'),
                    customListTile(Icons.ac_unit_outlined, 'companyName', 'PULSAR GROUP BREWERY" MAS‘ULIYATI CHEKLANGAN JAMIYATI'),
                    customListTile(Icons.insert_drive_file_sharp, 'taxID', '302798310'),
                    customListTile(Icons.preview_sharp, 'GCPrefix', '302798310'),
                    customListTile(Icons.ac_unit_outlined, 'numberOfTheDocumentConfirmingCompliance', 'UZ.SMT.01.331.2464995'),
                    customListTile(Icons.date_range, 'documentIssueDate', '08.08.2019'),
                    customListTile(Icons.date_range, 'documentValidityPeriod', '08.08.2019'),
                    customListTile(Icons.ac_unit_outlined, 'markOfConformity', 'O`z DSt'),
                    customListTile(Icons.ac_unit_outlined, 'closureType', 'O`z DSt'),
                    customListTile(Icons.date_range, 'closureMaterial', 'O`z DSt'),
                    customListTile(Icons.date_range, 'typeOfAlcoholicProducts', 'Пиво'),
                    customListTile(Icons.date_range, 'typeOfOutput', 'Светлое'),
                    customListTile(Icons.filter_alt_rounded, 'isUnfiltered', 'Нет'),
                    customListTile(Icons.ac_unit_outlined, 'initialWortExtractivity', '10 %'),
                    customListTile(Icons.no_drinks, 'alcoholCategory', 'Пивоваренный продукт'),
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
                      Text('Less info',style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor, fontSize: 14)),
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
          title: Text(context.tr(title),style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontSize: 14)),
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
