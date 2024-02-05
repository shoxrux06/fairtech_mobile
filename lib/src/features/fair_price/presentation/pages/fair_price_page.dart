import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FairPricePage extends StatefulWidget {
  const FairPricePage({super.key});

  @override
  State<FairPricePage> createState() => _FairPricePageState();
}

class _FairPricePageState extends State<FairPricePage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Fair Price'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppUtils.kGap12,
            item('DEXQON',  "Dehqon bozorlari"),
            item('YIRIK',  "Yirik savdo komplekslari"),
            item('KICHIK',  "Kichik do\'konlari"),
          ],
        ),
      )
    );
  }

  Widget item(String type, String name){
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12,bottom: 12),
      child: InkWell(
        onTap: (){
          context.push(Routes.subMarket,extra: {"type" : type});
        },
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          tileColor: Colors.grey.shade300,
          title: Text(name, style: context.textStyle.largeTitle2.copyWith(fontSize: 16),),
        ),
      ),
    );
  }
}
