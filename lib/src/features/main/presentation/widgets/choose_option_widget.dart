import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/bottom_sheet/custom_bottom_sheet.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/pages/tnved_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:go_router/go_router.dart';

class ChooseOptionWidget extends StatefulWidget {
  const ChooseOptionWidget({super.key});
  @override
  State<ChooseOptionWidget> createState() => _ChooseOptionWidgetState();
}

class _ChooseOptionWidgetState extends State<ChooseOptionWidget> {
  String _scanBarCodeResult = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(Icons.cancel_outlined),
            ),
          ),
          AppUtils.kGap12,
          Text('By QrCode yoki Barcode',  style: context.textStyle.regularTitle1,),
          AppUtils.kGap12,
          Text(
            'Choose one option',
            style: context.textStyle.regularTitle2,
          ),
          AppUtils.kGap24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.push(Routes.qrCode);
                  },
                  child: Container(
                    padding: AppUtils.kPaddingAll24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.color!.primaryText,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppConstants.foodImg,
                          height: 80,
                        ),
                        AppUtils.kGap24,
                        Text('Food',style: context.textStyle.regularTitle1,)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.push(Routes.qrCode);
                  },
                  child: Container(
                    padding: AppUtils.kPaddingAll24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.color!.primaryText,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppConstants.ingredientImg,
                          height: 80,
                        ),
                        AppUtils.kGap24,
                        Text('Ingredient',style: context.textStyle.regularTitle1,)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          AppUtils.kGap24,
          Text('By TnVed Code',style: context.textStyle.regularTitle1,),
          AppUtils.kGap24,
          CustomButtonWithoutGradient(onTap: (){
            context.push(Routes.tnVedCode);
          }, text: 'Choose')
        ],
      ),
    );
  }

  Future<void> scanQR() async {
    String barCodeScanRes = '';
    try {
      FlutterBarcodeScanner.getBarcodeStreamReceiver('ff6666', 'Cancel', true, ScanMode.QR);
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
