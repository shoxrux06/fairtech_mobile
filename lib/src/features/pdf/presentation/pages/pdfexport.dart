import 'dart:typed_data';
import 'package:fairtech_mobile/src/features/pdf/data/models/invoice.dart';
import 'package:fairtech_mobile/src/features/pdf/data/models/order_item.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf(Invoice invoice, String languageCode) async {
  final loadFonts1 =
      await rootBundle.load("assets/fonts/Montserrat/Montserrat-Regular.ttf");
  final loadFonts2 =
      await rootBundle.load("assets/fonts/Montserrat/Montserrat-Italic.ttf");
  final fontBase = Font.ttf(loadFonts1);
  final fontBold = Font.ttf(loadFonts2);

  final pdf = Document(
      theme: ThemeData.withFont(
    base: fontBase,
    bold: fontBold,
  ));
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List());

  List<OrderItem> newOrderItems = invoice.orderItems;
  List<OrderItem> firstPageProductList = [];

  if (newOrderItems.length <= 20) {
    for (int i = 0; i < newOrderItems.length; i++) {
      firstPageProductList.add(newOrderItems[i]);
    }
  }
  String titleText = 'QO\'MITA VA UNING HUDUDIY ORGANLARINING DAVLAT'
      ' BUYURTMASI BO\'YICHA O\'TKAZILGAN TANLOV (TENDER) SAVDOLARINI O\'RGANISH SOHASINING '
      'SAMARADORLIGI VA ULARNI BAHOLASH NATIJALARIGA DOIR MA\'LUMOTLAR';
  String hududlar = 'Hududlar';
  String jamiTrade = 'Jami o\'tkazilgan savdolar soni';
  String etenderTrade = 'Savdo tender.mc.uz orqali o\'tkazilgan';
  String tenderMcTrade = 'Savdo etender.uzex.uz orqali o\'tkazilgan';
  String xtXaridTrade = 'Savdo xt.xarid.uz orqali o\'tkazilgan';
  String _10000217topshiriqAsosidaTrade =
      '1000/02-17-son topshiriq asosida o\'rganilgan savdolar';
  String organishFoizi = 'O\'rganish foizi';
  String kamchilikAniqlanganTrades = 'Kamchilik aniqlangan savdolar';
  String organilganXaridlargaNisbatanFoiz =
      'O\'rganilgan xaridlarga nisbatan foizi';
  String organilmayQolganTrades = 'O\'rganilmay qolgan savdolar';
  String jamiOrganilganTradeNumbers = 'Jami o\'rganilgan savdolar soni';
  String kpiTizimBoyichaToplanganJamiBallar =
      'KPI-tizim bo\'yicha to\'plangan jami ballar';
  String _10000217topshiriqAsosidaBerilganBall =
      '1000/02-17-son topshiriq asosida xaridlarni o\'rganish hajmiga nisbatan berilgan ball (eng yuqori ball - 3 ball)';
  String xaridlarniOrganishHajmigaNisbatanBerilganBall =
      'Xaridlarni o\'rganish hajmiga nisbatan berilgan ball (eng yuqori ball - 4 ball)';
  String xaridlarniOrganishNatijasidaKamchiliklarAniqlanganlikUchunBerilganBall =
      'Xaridlarni o\'rganish natijasida kamchiliklar aniqlanganlik uchun berilgan ball (eng yuqori ball - 5 ball)';

  // pdf.addPage(
  //   Page(
  //     margin: const EdgeInsets.only(right: 48, left: 48, top: 24),
  //     pageFormat: PdfPageFormat.a4,
  //     build: (context) {
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Expanded(
  //                   child: Container(
  //                     padding: EdgeInsets.all(12),
  //                     // decoration: BoxDecoration(border: Border.all(color: PdfColor(0, 0, 0))),
  //                     child: Row(children: [
  //                       SizedBox(
  //                         height: 44,
  //                         width: 44,
  //                         child: Image(imageLogo),
  //                       ),
  //                       SizedBox(width: 12),
  //                       Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               'FAIR TECH',
  //                               style: TextStyle(
  //                                   fontSize: 5, fontWeight: FontWeight.bold),
  //                             ),
  //                             Text(
  //                               'YAGONA AXBOROT TIZIMI',
  //                               style: TextStyle(
  //                                   fontSize: 5, fontWeight: FontWeight.bold),
  //                             ),
  //                           ]
  //                       ),
  //                       SizedBox(width: 12),
  //                       Expanded(
  //                         child: Text(
  //                           titleText,
  //                           style: TextStyle(
  //                               fontSize: 5, fontWeight: FontWeight.bold),
  //                           textAlign: TextAlign.center,
  //                         ),
  //                       )
  //                     ]),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Column(children: [
  //             Container(
  //               width: double.infinity,
  //               padding: const EdgeInsets.all(4),
  //               decoration: BoxDecoration(color: PdfColor.fromInt(0xfffbe9e7), border: Border.all(color: PdfColor(0, 0, 0))),
  //               child: Text(
  //                 etenderTrade,
  //                 style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ),
  //             Table(
  //               border: TableBorder.all(color: PdfColors.black),
  //               children: [
  //                 TableRow(
  //                   children: [
  //                     Padding(
  //                       child: Text(
  //                         'N',
  //                         style: TextStyle(fontSize: 5, fontWeight: FontWeight.bold),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                       padding: EdgeInsets.all(4),
  //                     ),
  //                     Padding(
  //                       child: Text(
  //                         hududlar,
  //                         style: TextStyle(
  //                             fontSize: 5, fontWeight: FontWeight.bold),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                       padding: EdgeInsets.all(4),
  //                     ),
  //                     Padding(
  //                       child: Text(
  //                         jamiTrade,
  //                         style: TextStyle(fontSize: 5, fontWeight: FontWeight.bold),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                       padding: const EdgeInsets.all(4),
  //                     ),
  //                     Padding(
  //                       child: Text(
  //                         etenderTrade,
  //                         style: TextStyle(fontSize: 5, fontWeight: FontWeight.bold),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                       padding: const EdgeInsets.all(4),
  //                     ),
  //                     Padding(
  //                       child: Text(
  //                         tenderMcTrade,
  //                         style: TextStyle(
  //                             fontSize: 5, fontWeight: FontWeight.bold),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                       padding: EdgeInsets.all(4),
  //                     ),
  //                     Padding(
  //                       child: Text(
  //                         xtXaridTrade,
  //                         style: TextStyle(
  //                             fontSize: 5, fontWeight: FontWeight.bold),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                       padding: EdgeInsets.all(4),
  //                     ),
  //                     Padding(
  //                       child: Text(
  //                         _10000217topshiriqAsosidaTrade,
  //                         style: TextStyle(
  //                             fontSize: 5, fontWeight: FontWeight.bold),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                       padding: EdgeInsets.all(4),
  //                     ),
  //                   ],
  //                 ),
  //                 ...firstPageProductList.map((orderItem) {
  //                   int index = firstPageProductList.indexOf(orderItem);
  //                   return TableRow(
  //                     verticalAlignment: TableCellVerticalAlignment.middle,
  //                     children: [
  //                       // Expanded(
  //                       //   child: PaddedText("${index + 1}"),
  //                       //   flex: 1,
  //                       // ),
  //                       Expanded(
  //                         child: PaddedText("${orderItem.hududlar}"),
  //                         flex: 2,
  //                       ),
  //                       Expanded(
  //                         child: PaddedText("${orderItem.jamiTrade}"),
  //                         flex: 1,
  //                       ),
  //                       Expanded(
  //                         child: PaddedText("${orderItem.etenderTrade}"),
  //                         flex: 1,
  //                       ),
  //                       Expanded(
  //                         child: PaddedText("${orderItem.tenderMcTrade}"),
  //                         flex: 1,
  //                       ),
  //                       Expanded(
  //                         child: PaddedText("${orderItem.xtXaridTrade}"),
  //                         flex: 1,
  //                       ),
  //                       Expanded(
  //                         child:
  //                             PaddedText("${orderItem.topshiriqAsosidaTrade}"),
  //                         flex: 1,
  //                       ),
  //                     ],
  //                   );
  //                 }),
  //               ],
  //             ),
  //           ]),
  //         ],
  //       );
  //     },
  //   ),
  // );

  return pdf.save();
}

Widget CustomText(
  final String text, {
  final TextAlign align = TextAlign.right,
  final TextStyle? style,
}) =>
    Padding(
      padding: EdgeInsets.all(2),
      child: Text(text, textAlign: align, style: TextStyle(fontSize: 4)),
    );

Widget CustomTextDiscount(
  final String text, {
  final TextAlign align = TextAlign.right,
  final TextStyle? style,
}) =>
    Padding(
      padding: EdgeInsets.all(2),
      child: Text(text,
          textAlign: align,
          style: TextStyle(fontSize: 4, color: PdfColor.fromInt(0xfff44336))),
    );

Widget CustomTextDiscountTwo(
  final String text, {
  final TextAlign align = TextAlign.center,
  final TextStyle? style,
}) =>
    Padding(
      padding: EdgeInsets.all(2),
      child: Text(text,
          textAlign: align,
          style: const TextStyle(fontSize: 4, color: PdfColor.fromInt(0xfff44336))),
    );

Widget CustomTextTwo(
  final String text, {
  final TextAlign align = TextAlign.center,
  final TextStyle? style,
}) =>
    Padding(
      padding: EdgeInsets.all(2),
      child: Text(text,
          textAlign: align,
          style: TextStyle(
            fontSize: 4,
          )),
    );

Widget CustomCategoryNameText(
  final String text, {
  final TextAlign align = TextAlign.center,
  final TextStyle? style,
}) =>
    Padding(
      padding: EdgeInsets.all(4),
      child: Text(text,
          textAlign: align,
          style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
    );

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.center,
  final TextStyle? style,
}) =>
    Padding(
      padding: EdgeInsets.all(4),
      child: Text(text, textAlign: align, style: TextStyle(fontSize: 8)),
    );
