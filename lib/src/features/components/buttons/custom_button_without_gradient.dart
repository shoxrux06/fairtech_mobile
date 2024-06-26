import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonWithoutGradient extends StatelessWidget {
  const CustomButtonWithoutGradient({super.key,required this.onTap, required this.text, this.color, this.textColor});

  final Function onTap;
  final String text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color ?? context.theme.primaryColor,
        ),
        child:Center(
          child: Text(
            text,
              style: context.textStyle.regularTitle2.copyWith(color: textColor?? context.color?.primaryText)
          ),
        ),
      ),
    );
  }
}
