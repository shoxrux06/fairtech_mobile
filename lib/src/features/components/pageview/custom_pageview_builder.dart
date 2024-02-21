import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:flutter/material.dart';

class CustomPageViewBuilder extends StatefulWidget {
  CustomPageViewBuilder({super.key,required this.child1,required this.child2, required this.list});

  Widget child1;
  Widget child2;
  final List<String> list;

  @override
  State<CustomPageViewBuilder> createState() => _CustomPageViewBuilderState();
}

class _CustomPageViewBuilderState extends State<CustomPageViewBuilder> {
  PageController controller = PageController(initialPage: 0);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
            controller:controller,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return widget.child1;
                case 1:
                  return widget.child2;
                default:
                  return Container();
              }
            }),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Container(
                height: 54,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  // color: Colors.black12,
                    border: Border.all(
                        color: Colors.black12,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ..._buildIndicator()
                    ],
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }

  //Indicator Builder
  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];
    for (var i = 0; i < widget.list.length; i++) {
      if (selectedIndex == i) {
        indicators.add(_indicatorsTrue(widget.list[i]));
      } else {
        indicators.add(_indicatorsFalse(widget.list[i], i));
      }
    }
    return indicators;
  }

  Widget _indicatorsTrue(String text) {
    final Color color;
    if (selectedIndex == 0) {
      color = context.theme.primaryColor;
    } else if (selectedIndex == 1) {
      color = context.theme.primaryColor;
    } else {
      color = context.theme.primaryColor;
    }

    //Active Indicator
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: Expanded(
          child: Row(
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text,
                    style: context.textStyle.regularTitle2.copyWith(color: Colors.white),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Inactive Indicator
  Widget _indicatorsFalse(String text, int index) {
    return InkWell(
      onTap: () {
        controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Center(
          child: Expanded(
            child: Row(
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      text,
                      style:
                      context.textStyle.regularTitle2.copyWith(color: Colors.black),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

