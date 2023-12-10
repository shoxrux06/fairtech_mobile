import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ChooseOptionPage extends StatefulWidget {
  const ChooseOptionPage({super.key});

  @override
  State<ChooseOptionPage> createState() => _ChooseOptionPageState();
}

class _ChooseOptionPageState extends State<ChooseOptionPage> {
  String _scanBarCodeResult = '';
  String infoText = '“Product Info” axborot tizimi - isteʼmolchilar mobil'
      ' ilova orqali isteʼmol bozorida muomalada bo‘lgan tovar (ish, xizmat)lar'
      ' to‘g‘risida maʼlumotlarni onlayn tarzda olish maqsadida ishlab chiqilgan.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Product info'),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.push(Routes.qrCode);
      },child: SvgPicture.asset(AppConstants.scannerSvg,color: Colors.white,)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: item(
                    () {
                      context.push(Routes.mxikCode);
                    },
                    AppConstants.scanSvg,
                    'Mxik kod',
                  ),
                ),
                AppUtils.kGap8,
                Expanded(
                  child: item(
                    () {
                      context.push(Routes.shtrixCode);
                    },
                    AppConstants.barcodeSvg,
                    'Mahsulot shtrix-kodi',
                  ),
                ),
                AppUtils.kGap8,
                Expanded(
                  child: item(
                    () {
                      context.push(Routes.tnVedCode);
                    },
                    AppConstants.tnVedSvg,
                    'TIF-TN kod',
                  ),
                ),
                AppUtils.kGap8,
                Expanded(
                  child: item(
                    () {
                      moreInfo();
                    },
                    AppConstants.more3Svg,
                    'Qoshimcha imkoniyat',
                  ),
                ),
              ],
            ),
            AppUtils.kGap24,
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: context.theme.primaryColor,
                  width: 1,
                )
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppConstants.allSvg,
                    width: Responsive.width(100, context),
                    height: 32,
                    color: context.theme.primaryColor,
                  ),
                ),
                AppUtils.kGap8,
                Text(
                  infoText,
                  style: context.textStyle.regularTitle1.copyWith(fontSize: 14, color: context.theme.primaryColor,),
                  textAlign: TextAlign.center,
                ),
              ],
          ),
            )
          ],
        ),
      ),
    );
  }

  void moreInfo() {
    showDialog(
      context: scaffoldKey.currentContext!,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text('Qoshimcha malumotlar', style: ctx.textStyle.regularTitle2.copyWith(color: ctx.theme.primaryColor)),
          content: Text('Qoshimcha malumotlar',style: ctx.textStyle.regularTitle2),
          actions: [
            TextButton(
              onPressed: () {
                ctx.pop();
              },
              child: Text('Ok',style: ctx.textStyle.regularTitle2.copyWith(color: ctx.theme.primaryColor)),
            ),
          ],
        );
      },
    );
  }

  Widget item(Function()? onTap,String icon, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Colors.black12,
                )
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              icon,
              width: 32,
              height: 32,
              color: context.theme.primaryColor,
            ),
          ),
        ),
        AppUtils.kGap8,
        Text(
          text,
          style: context.textStyle.regularTitle1.copyWith(fontSize: 12, color: context.theme.primaryColor,),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Future<void> scanQR() async {
    String barCodeScanRes = '';
    try {
      FlutterBarcodeScanner.getBarcodeStreamReceiver(
          'ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barCodeScanRes = 'Failed to get platform version';
    }
    if (!mounted) {
      setState(() {
        _scanBarCodeResult = barCodeScanRes;
      });
    }
  }
}
