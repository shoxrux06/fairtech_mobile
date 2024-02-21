import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/fair_price/domain/entity/market_product_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MultipleProductPage extends StatelessWidget {
  const MultipleProductPage({super.key, required this.children});

  final List<MarketProductListEntity> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ...children.map((e) => InkWell(
              onTap: (){
                context.push(Routes.productDetail, extra: {'product': e});
              },
              child: Container(
                width: Responsive.width(100, context),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black12
                    )
                ),
                child: Text(e.nameLt ??''),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
