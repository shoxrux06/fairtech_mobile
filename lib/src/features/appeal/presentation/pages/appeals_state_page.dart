import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:flutter/material.dart';

class AppealsStatePage extends StatefulWidget {
  const AppealsStatePage({super.key});

  @override
  State<AppealsStatePage> createState() => _AppealsStatePageState();
}

class _AppealsStatePageState extends State<AppealsStatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppUtils.kGap40,
          AppUtils.kGap24,
          Spacer(),
          Text('Hech qanday ma\'lumot topilmadi',style:context.textStyle.regularTitle2.copyWith(color: Colors.black),),
          Spacer(),
          // PopupMenuButton(itemBuilder: itemBuilder)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: PopupMenuButton<int>(
                icon: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      borderRadius: BorderRadius.circular(48)
                    ),
                    child: Icon(Icons.filter_alt_rounded, color: Colors.white,)),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("Ijro jarayonida",style:context.textStyle.regularTitle2.copyWith(color: Colors.black),),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Yakunlangan",style:context.textStyle.regularTitle2.copyWith(color: Colors.black),),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Barchasi",style:context.textStyle.regularTitle2.copyWith(color: Colors.green),),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
