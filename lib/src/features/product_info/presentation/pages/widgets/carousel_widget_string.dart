import 'package:carousel_slider/carousel_slider.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class CarouselWidgetString extends StatelessWidget {
  const CarouselWidgetString({super.key,required this.images});

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            aspectRatio: 1.8,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 0,
            autoPlay: true,
            enlargeFactor: 0.8
        ),
        items:images.map((item) => Container(
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
                  Image.network(item, fit: BoxFit.contain, width: Responsive.width(80, context), height: Responsive.height(40, context),
                    errorBuilder: (context,_,r){
                      return const Center(
                        child: Icon(
                            Icons.error
                        ),
                      );
                    },),
                ],
              )),
        )).toList()
    );
  }
}
