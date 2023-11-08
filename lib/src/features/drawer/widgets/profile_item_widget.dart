import 'package:flutter/material.dart';
import '../../../core/utils/app_utils.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              Ink(
                padding: AppUtils.kPaddingAll4,
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius6,
                  color: iconBackgroundColor,
                ),
                child: Icon(icon),
              ),
              const SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(subTitle),
                ],
              )
            ],
          ),
        ),
      );
}
