import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class StackImage extends StatelessWidget {
  const StackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          AppConstants.oilPng,
          width: 100,
          height: 100,
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
          child: Image.asset(
            AppConstants.oil2Png,
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
