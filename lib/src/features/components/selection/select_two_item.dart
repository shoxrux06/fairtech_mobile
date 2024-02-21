import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectTwoItem extends StatelessWidget {
  const SelectTwoItem({super.key, required this.onTap,required this.icon, required this.text});

  final VoidCallback onTap;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: InkWell(
        onTap:onTap,
        child: Container(
          // width: Responsive.width(40, context),
          // height: Responsive.height(20, context),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: context.theme.primaryColor.withOpacity(.3),
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: const Offset(3, -3)
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(child: Column(
              children: [
                SvgPicture.asset(icon, width: 48,height: 48,color: context.theme.primaryColor,),
                Divider(
                  height: 2,
                  color: context.theme.primaryColor,
                ),
                Text(text, style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor,),textAlign: TextAlign.center,),
              ],
            ),),
          ),
        ),
      ),
    );
  }
}
