import 'package:fairtech_mobile/src/core/di/dependency_manager.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/bloc/appeals_bloc.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/pages/create_appeals_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/product_info_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/product_owner_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScannerResultPage extends StatefulWidget {
  // final String code;
  // final Function onClose;

  const ScannerResultPage({
    super.key,
    // required this.code,
    // required this.onClose,
  });

  @override
  State<ScannerResultPage> createState() => _ScannerResultPageState();
}

class _ScannerResultPageState extends State<ScannerResultPage>
    with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 0);
  final ScrollController _scrollController = ScrollController();


  int _selectedIndex = 0;

  final list = [
    'Mahsulot',
    'Ishlab chiqaruvchi',
    'Murojaat yuborish'
  ];

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      int newPage = controller.page!.round();
      if (newPage != _selectedIndex) {
        setState(() {
          _selectedIndex = newPage;
          _scrollController.animateTo(
            _selectedIndex * 250, // Adjust based on your item size
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppealsBloc(appealsRepository),
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                itemCount: list.length,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const ProductInfoPage();
                    case 1:
                      return const ProductOwnerInfoPage();
                    case 2:
                      return const CreateAppealsPage();
                    default:
                      return Container();
                  }
                }),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                leadingWidth: 0,
                automaticallyImplyLeading: false,
                title: Container(
                  color: Colors.white,
                  height: 44,
                  width: Responsive.width(100, context),
                  child: ListView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    children: [..._buildIndicator()],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Indicator Builder
  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];
    for (var i = 0; i < list.length; i++) {
      if (_selectedIndex == i) {
        indicators.add(_indicatorsTrue(list[i]));
      } else {
        indicators.add(_indicatorsFalse(list[i], i));
      }
    }
    return indicators;
  }

  Widget _indicatorsTrue(String text) {
    final Color color;
    if (_selectedIndex == 0) {
      color = context.theme.primaryColor;
    } else if (_selectedIndex == 1) {
      color = context.theme.primaryColor;
    } else {
      color = context.theme.primaryColor;
    }

    //Active Indicator
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: context.textStyle.regularTitle2.copyWith(color: Colors.white),
        ),
      ),
    );
  }

//Inactive Indicator
  Widget _indicatorsFalse(String text, int index) {
    return InkWell(
      onTap: () {
        controller.animateToPage(
            index, duration: Duration(milliseconds: 300), curve: Curves.linear);
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Center(
          child: Text(
            text,
            style:
            context.textStyle.regularTitle2.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }

}
