import 'package:carousel_slider/carousel_slider.dart';
import 'package:fairtech_mobile/src/features/product_info/data/models/mxik_and_shtrix_code_response.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key, required this.catalog});

  final List<CatalogDatum> catalog;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.8,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 0,
          autoPlay: true,
        ),
        items: catalog.map((item) => Container(
          decoration: BoxDecoration(
              border: Border.all(
                color:Colors.grey.shade200,
              ),
              borderRadius: BorderRadius.circular(12)
          ),
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item.productImageUrl, fit: BoxFit.contain, width: Responsive.width(80, context), height: Responsive.height(40, context),
                    errorBuilder: (context,_,r){
                      return const Center(
                        child: Icon(
                            Icons.error
                        ),
                      );
                    },),
                ],
              )),
        )).toList());
  }
}
