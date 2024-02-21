import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.icon,required this.title, this.onTap, required this.subTitle, });

  final String icon;
  final String title;
  final String subTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor:  context.theme.primaryColor.withOpacity(.2),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(4),
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
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    AppUtils.kGap24,
                    SvgPicture.asset(icon, width: 44,height: 44,color: context.theme.primaryColor,),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: context.textStyle.regularTitle2.copyWith(
                          color: context.theme.primaryColor,
                      ),
                    ),
                    Divider(
                      color: context.theme.primaryColor,
                      height: 2,
                    ),
                    Text(
                      subTitle,
                      textAlign: TextAlign.center,
                      style: context.textStyle.regularTitle2.copyWith(
                        color: context.theme.primaryColor.withOpacity(0.8),
                        fontSize: 12
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
