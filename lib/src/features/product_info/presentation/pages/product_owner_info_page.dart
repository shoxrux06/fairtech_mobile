import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:flutter/material.dart';

class ProductOwnerInfoPage extends StatefulWidget {
  const ProductOwnerInfoPage({super.key});

  @override
  State<ProductOwnerInfoPage> createState() => _ProductOwnerInfoPageState();
}

class _ProductOwnerInfoPageState extends State<ProductOwnerInfoPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppUtils.kGap40,
          AppUtils.kGap40,
          Center(
            child: Text('Ishlab chiqaruvchi haqida ma\'lumot topilmadi', textAlign: TextAlign.center,)
          )
        ],
      ),
    );
  }
}
