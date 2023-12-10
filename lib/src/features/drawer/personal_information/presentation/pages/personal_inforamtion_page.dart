import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.tr('personalInformation'),
      ),
      body: Container(
        // padding: AppUtils.kPaddingAll12,
        // child: Text(
        //   context.tr('personalInfoBodyText'),
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: context.color?.secondaryText,
        //     fontSize: 14,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
      ),
    );
  }
}
