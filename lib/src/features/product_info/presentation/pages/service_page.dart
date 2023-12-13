import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../components/app_bar/custom_app_bar.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ish va xizmatlar'),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            item(
              () {
                context.push(Routes.mxikCode);
              },
              AppConstants.scanSvg,
              'Mxik kod',
            ),
          ],
        ),
      ),
    );
  }

  Widget item(Function()? onTap, String icon, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Colors.black12,
                )
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              icon,
              width: 32,
              height: 32,
              color: context.theme.primaryColor,
            ),
          ),
        ),
        AppUtils.kGap8,
        Text(
          text,
          style: context.textStyle.regularTitle1.copyWith(
            fontSize: 12,
            color: context.theme.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
