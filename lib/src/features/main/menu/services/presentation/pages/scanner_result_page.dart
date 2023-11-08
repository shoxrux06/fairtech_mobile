import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ScannerResultPage extends StatefulWidget {
  final String code;
  final Function onClose;

  const ScannerResultPage({
    super.key,
    required this.code,
    required this.onClose,
  });

  @override
  State<ScannerResultPage> createState() => _ScannerResultPageState();
}

class _ScannerResultPageState extends State<ScannerResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Scanner result response'),
      body: Center(child: Text('${widget.code}')),
    );
  }
}
