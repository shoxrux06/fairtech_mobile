import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/selection/select_two_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProductOrServicePage extends StatefulWidget {
  const ProductOrServicePage({super.key});

  @override
  State<ProductOrServicePage> createState() => _ProductOrServicePageState();
}

class _ProductOrServicePageState extends State<ProductOrServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Tovar yoki xizmatlar'),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SelectTwoItem(
                  onTap: () {
                    context.push(Routes.chooseOption);
                  },
                  icon: AppConstants.productNameSvg,
                  text: 'Tovar \n(Mahsulot)',
                ),
                AppUtils.kGap24,
                SelectTwoItem(
                  onTap: () {
                    context.push(Routes.service);
                  },
                  icon: AppConstants.servicesSvg,
                  text:  'Ish \n(xizmatlar)',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
