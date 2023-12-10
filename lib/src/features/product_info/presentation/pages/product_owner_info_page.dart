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
    return Column(
      children: [
        AppUtils.kGap40,
        AppUtils.kGap40,
        customListTile(Icons.branding_watermark, 'Korxona nomi', 'Coco cola LTD'),
        customListTile(Icons.gps_fixed_rounded, 'Manzil', 'O\'zbekistan, Toshkent'),
        customListTile(Icons.confirmation_number_sharp, 'STIR', '123456789'),
        customListTile(Icons.info, 'Qo\'shimcha ,ma\'lumotlar', 'Qo\'shimcha ,ma\'lumotlar'),
      ],
    );
  }

  Widget customListTile(IconData icon, String title, String subTitle){
    return Column(
      children: [
        ListTile(
          leading: Icon(icon,color: context.theme.primaryColor),
          title: Text(title,style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontSize: 14)),
          subtitle: Text(subTitle,style: context.textStyle.largeTitle2.copyWith(color: context.theme.primaryColor),),
        ),
        const Divider(
          height: 1,
          color: Colors.black12,
        ),
      ],
    );
  }
}
