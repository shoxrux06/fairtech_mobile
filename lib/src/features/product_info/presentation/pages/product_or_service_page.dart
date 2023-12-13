import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
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
      appBar: CustomAppBar(title: 'Product info yoki xizmat'),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      context.push(Routes.chooseOption);
                    },
                    child: Container(
                      width: Responsive.width(40, context),
                      height: Responsive.height(20, context),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: context.theme.primaryColor.withOpacity(.3),
                                blurRadius: 6,
                                spreadRadius: 1,
                                offset: Offset(3, -3)
                            )
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Center(child: Text('Tovar (Mahsulot)', style: context.textStyle.largeTitle2,textAlign: TextAlign.center,),),
                      ),
                    ),
                  ),
                ),
                AppUtils.kGap24,
                Expanded(
                  child: InkWell(
                    onTap: (){
                      context.push(Routes.service);
                    },
                    child: Container(
                      width: Responsive.width(40, context),
                      height: Responsive.height(20, context),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: context.theme.primaryColor.withOpacity(.3),
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: Offset(3, -3)
                          )
                        ]
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Center(child: Text('Ish (xizmatlar)', style: context.textStyle.largeTitle2,textAlign: TextAlign.center,),),
                      ),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
