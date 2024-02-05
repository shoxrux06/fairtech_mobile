import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class NoImageWidget extends StatelessWidget {
  const NoImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppConstants.noImage,
      width: Responsive.width(80, context),
      height: Responsive.height(25, context),
      fit: BoxFit.fill,
    );
  }
}
