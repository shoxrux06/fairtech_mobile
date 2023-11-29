import 'dart:typed_data';
import 'package:fairtech_mobile/src/features/pdf/data/models/invoice.dart';
import 'package:fairtech_mobile/src/features/pdf/presentation/pages/pdfexport.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatefulWidget {
  final Invoice invoice;
  const PdfPreviewPage({Key? key, required this.invoice}) : super(key: key);

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  String languageCode = '';

  Widget? loadingWidget(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Please wait...',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Future<Uint8List> getFile()async{
    return await makePdf(widget.invoice, languageCode);
  }
  Uint8List generatedFile = Uint8List(0);

  // Future<void> uploadFile() async {
  //   final response = await context.read<InvoiceProvider>().uploadInvoices(
  //     generatedFile,
  //   );
  //   if (response?.status == 'success') {
  //     AppSnackBar.showSuccessSnackBar(context, 'Success', 'Succes');
  //   } else if (response?.status == 'failure') {
  //     AppSnackBar.showErrorSnackBar(context, 'Error', 'Error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    languageCode = Localizations.localeOf(context).languageCode;
    final screenWidth = MediaQuery.of(context).size.width;
    print('Loading Widget --->${loadingWidget(context)}');

    return Scaffold(
      body: InteractiveViewer(
        panAxis: PanAxis.horizontal,
        child: PdfPreview(
          canChangePageFormat: false,
          allowPrinting: false,
          allowSharing: false,
          canChangeOrientation: false,
          loadingWidget: loadingWidget(context),
          build: (_) async{
            generatedFile = await makePdf(widget.invoice, languageCode);
            return generatedFile;
          },
        ),
      ),
    );
  }
}
