import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AboutSystemPage extends StatefulWidget {
  const AboutSystemPage({super.key});

  @override
  State<AboutSystemPage> createState() =>
      _AboutSystemPageState();
}

class _AboutSystemPageState extends State<AboutSystemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.tr('aboutTheSystem')),
      body: Container(
        padding: AppUtils.kPaddingAll12,
        child: Text(
          context.tr('personalInfoBodyText'),
          textAlign: TextAlign.center,
          style: context.textStyle.regularTitle2,
        ),
      ),
    );
  }
}
