import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/selection/select_two_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PriceLookCreatePage extends StatefulWidget {
  const PriceLookCreatePage({super.key, required this.type});

  final String type;

  @override
  State<PriceLookCreatePage> createState() => _PriceLookCreatePageState();
}

class _PriceLookCreatePageState extends State<PriceLookCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select'),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SelectTwoItem(
                  onTap: () {
                    context.push(Routes.subMarket, extra: {"type": widget.type});
                  },
                  icon: AppConstants.productNameSvg,
                  text: 'Narxni kiritish',
                ),
                AppUtils.kGap24,
                SelectTwoItem(
                  onTap: () {

                  },
                  icon: AppConstants.servicesSvg,
                  text:  'Narxlarni ko\'rish',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
