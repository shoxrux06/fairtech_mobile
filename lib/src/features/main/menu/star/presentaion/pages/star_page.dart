import 'package:fairtech_mobile/src/features/main/menu/profile/data/local_data.dart';
import 'package:fairtech_mobile/src/features/main/menu/star/presentaion/widgets/region_item_widget.dart';
import 'package:flutter/material.dart';

class StarPage extends StatefulWidget {
  const StarPage({super.key});

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegionItemWidget(orderItems: LocalData.orderItems,)
    );
  }
}
