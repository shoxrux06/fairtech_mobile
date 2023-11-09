import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/features/components/bottom_sheet/custom_bottom_sheet.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/bloc/services_bloc.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/pages/qr_scanner_overlay.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/pages/widgets/tn_ved_code_response_widget.dart';
import 'package:fairtech_mobile/src/features/main/menu/services/presentation/pages/widgets/fiscal_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScreenPage extends StatefulWidget {
  const QrCodeScreenPage({
    super.key,
  });

  @override
  State<QrCodeScreenPage> createState() => _QrCodeScreenPageState();
}

class _QrCodeScreenPageState extends State<QrCodeScreenPage> {
  MobileScannerController cameraController = MobileScannerController();

  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ServicesBloc, ServicesState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Stack(
            children: [
              MobileScanner(
                controller: cameraController,
                startDelay: true,
                onDetect: (capture) {
                  if (!isScanCompleted) {
                    String code = capture.barcodes.first.rawValue ?? '---';
                    isScanCompleted = true;
                    context.push(Routes.scannerResult, extra: {
                      'code': code,
                      'closeScreen':closeScreen,
                    });
                  }
                },
              ),
              QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
              Positioned(
                right: 24,
                top: 40,
                child: InkWell(
                  onTap: () => cameraController.toggleTorch(),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: const Color(0xFF646261)
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: cameraController.torchState,
                      builder: (context, state, child) {
                        switch (state as TorchState) {
                          case TorchState.off:
                            return Image.asset(
                              AppConstants.sunImg,
                              color: Colors.black,
                              width: 24,
                              height: 24,
                            );
                          case TorchState.on:
                            return Image.asset(
                              AppConstants.sunImg,
                              color: Colors.yellow,
                              width: 24,
                              height: 24,
                            );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 40,
                child: InkWell(
                  onTap: () {
                    context.pop();
                    context.pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 16, right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: const Color(0xFF646261)),
                    child: const Center(
                        child: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    )),
                  ),
                ),
              ),
              Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: CustomButtonWithoutGradient(
                      onTap:() {
                        print('yess pos');
                        customModalBottomSheet<void>(
                            context: context,
                            builder: (_, controller) => const FiscalNumberWidget()
                        );
                      },
                      text: 'Send by code',
                      textColor: Colors.white,
                  )
              )
            ],
          );
        },
      ),
    );
  }
}
