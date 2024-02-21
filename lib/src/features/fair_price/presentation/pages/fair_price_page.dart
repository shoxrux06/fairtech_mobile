import 'dart:io';

import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/bloc/fair_price_bloc.dart';
import 'package:fairtech_mobile/src/features/fair_price/presentation/widgets/product_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FairPricePage extends StatefulWidget {
  const FairPricePage({super.key});

  @override
  State<FairPricePage> createState() => _FairPricePageState();
}

class _FairPricePageState extends State<FairPricePage> {
  final controller = PageController(initialPage: 0);
  final ScrollController _scrollController = ScrollController();


  int _selectedIndex = 0;

  final list = [
    'Iste’mol mahsulotlari',
    'Boshqa mahsulotlar',
  ];

  String img = 'images/productImages/wheat_drlmmhwvpnzksfebttjaizhabmvmckugsgucoptwxvnxmpczjlqtiasfdccahnnbwyjseirfxcsdafbpablkyygeptdbhzjcrkfa1707883178417.svg';
  @override
  void initState() {
    context.read<FairPriceBloc>().add(
        GetMarketProductListByTypeEvent(
            onSuccess: (){
              print('Omad2');
            },
            onError: (){},
            context: context,
            code: 'FOODS',
            type: ''
        )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {return BlocBuilder<FairPriceBloc, FairPriceState>(
  builder: (context, state) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Fair Price', textColor: context.theme.primaryColor,),
      body: ModalProgressHUD(
        inAsyncCall: state.productListLoading,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image.network(img, width: 100,height: 100,),
              // Image.file(File(img), width: 100,height: 100,),
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppConstants.fairPrice,
                          width: Responsive.width(20, context),
                          height: Responsive.height(10, context),
                        ),
                        AppUtils.kGap12,
                        Expanded(child: Text('Asosiy turdagi 20 dan ortiq ijtimoiy muhim ahamiyatga '
                            'ega va strategik tovarlar narxlarining keskin tebranishlari oldini olish, '
                            'narxlarning asossiz o‘sishi holatlarini aniqlash maqsadida tizimli monitoring '
                            'olib borish uchun yaratilgan axborot tizimi.',
                          textAlign: TextAlign.justify,
                          style: context.textStyle.regularBody.copyWith(color: context.theme.primaryColor, fontSize: 12),
                        ))
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ..._buildIndicator()
                      ],
                    ),
                  ],
                ),
              ),
              AppUtils.kGap12,
              Expanded(
                child: PageView.builder(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                      if(_selectedIndex == 0){
                        context.read<FairPriceBloc>().add(
                            GetMarketProductListByTypeEvent(
                                onSuccess: (){
                                  print('Omad2');
                                },
                                onError: (){},
                                context: context,
                                code: 'FOODS',
                                type: ''
                            )
                        );
                      }else if(_selectedIndex == 1){
                        context.read<FairPriceBloc>().add(
                            GetMarketProductListByTypeEvent(
                                onSuccess: (){
                                  print('Omad2');
                                },
                                onError: (){},
                                context: context,
                                code: 'OTHERS',
                                type: ''
                            )
                        );
                      }
                    },
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return ProductTypeWidget(selectedIndex: _selectedIndex,);
                        case 1:
                          return ProductTypeWidget(selectedIndex: _selectedIndex,);
                        default:
                          return Container();
                      }
                    }),
              ),
            ],
          ),
        ),
      )
    );
  },
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: context.textStyle.regularTitle2.copyWith(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }

//Inactive Indicator
  Widget _indicatorsFalse(String text, int index) {
    return InkWell(
      onTap: () {
        controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Center(
          child: Text(
            text,
            style:
            context.textStyle.regularTitle2.copyWith(color: Colors.black, fontSize: 12),
          ),
        ),
      ),
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
