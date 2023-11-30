import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        customListTile(Icons.local_drink, 'nameOfTheOrganization', 'Coco cola LTD'),
        customListTile(Icons.local_drink, 'address', 'Uzbekistan, Tashkent'),
        customListTile(Icons.local_drink, 'STIR', '123456789t'),
        customListTile(Icons.local_drink, 'additionalInformation', 'Some info'),
      ],
    );
  }

  Widget customListTile(IconData icon, String title, String subTitle){
    return Column(
      children: [
        ListTile(
          leading: Icon(icon,color: context.theme.primaryColor),
          title: Text(context.tr(title),style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontSize: 14)),
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
