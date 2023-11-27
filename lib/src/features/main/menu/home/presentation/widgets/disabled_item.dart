import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DisabledItem extends StatelessWidget {
  const DisabledItem({super.key, required this.icon,required this.title, required this.subTitle, this.onTap});

  final String icon;
  final String title;
  final String subTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            child: Container(
              height: Responsive.height(22, context),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  SvgPicture.asset(icon, width: 44,height: 44),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.textStyle.regularTitle2.copyWith(
                      color: context.theme.primaryColor.withOpacity(0.5),
                    ),
                  ),
                  Divider(
                    color: context.theme.primaryColor.withOpacity(0.5),
                    height: 2,
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: context.textStyle.regularTitle2.copyWith(
                        color: context.theme.primaryColor.withOpacity(0.3),
                        fontSize: 12
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                  color: context.theme.primaryColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(32)
              ),
              padding: EdgeInsets.all(4),
              child: const Center(
                child: Icon(Icons.star, size: 16,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
