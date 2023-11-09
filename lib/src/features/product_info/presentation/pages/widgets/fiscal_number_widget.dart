import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiscalNumberWidget extends StatelessWidget {
  const FiscalNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Code orqali yuborish',
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter the code',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
            AppUtils.kGap4,
            CustomTextField(
              hintText: '- - - - - - - - - - - - - -',
              keyboardType: TextInputType.number,
            )
          ],
        ),
      ),
    );
  }
}
