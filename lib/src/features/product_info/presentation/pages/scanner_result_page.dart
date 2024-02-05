import 'dart:io';
import 'dart:typed_data';

import 'package:fairtech_mobile/src/core/dynamic_link/dynamic_link.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/product_info_page.dart';
import 'package:fairtech_mobile/src/features/product_info/presentation/pages/product_owner_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class ScannerResultPage extends StatefulWidget {
  final String code;
  final Function onClose;

  const ScannerResultPage({
    super.key,
    required this.code,
    required this.onClose,
  });

  @override
  State<ScannerResultPage> createState() => _ScannerResultPageState();
}

class _ScannerResultPageState extends State<ScannerResultPage>
    with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 0);
  final ScrollController _scrollController = ScrollController();

  ScreenshotController screenshotController = ScreenshotController();
  late File customFile;

  Future<void> widgetToImageFile(Uint8List capturedImage,) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    String path = '$tempPath/$ts.png';
    customFile = await File(path).writeAsBytes(capturedImage);
  }

  initFile() async {
    await screenshotController.captureFromWidget(Container(
      decoration: BoxDecoration(
          border: Border.all(
            color:Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(12),
      height: 150,
      child: SfBarcodeGenerator(value:widget.code,showValue: true,),
    ),).then((capturedImage) async{
      widgetToImageFile(capturedImage);
    });
  }

  int _selectedIndex = 0;
  bool isNothing = false;

  final list = [
    'Mahsulot',
    'Ishlab chiqaruvchi',
  ];

  @override
  void initState() {
    initFile();
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
    context.read<ProductInfoBloc>().add(GetProductInfoByScannerEvent(
        context: context,
        onSuccess: (){

        },
        onError: (){},
        lang: 'uz_latin',
        internationalCode: widget.code)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc,ProductInfoState>(
      builder: (context,state){
        if(state.isGettingProductDataByScanner){
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        }else{
          if(state.isSuccessProductDataByScanner){
            if((state.mxikAndShtrixCodeResponse?.data.mxikInfo.internationalCode.isEmpty?? false) &&
                (state.mxikAndShtrixCodeResponse?.data.mxikCode.isEmpty ?? false)){
              return Scaffold(
                appBar: CustomAppBar(title: 'Ma\'lumotlar'),
                body: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(child: Text('Tanlangan mahsulot "Milliy tasnif" da ro\'yxatdan o\'tmagan',style:context.textStyle.regularTitle2.copyWith(color: Colors.black),textAlign: TextAlign.center,),),
                ),
              );
            }
            return Scaffold(
              appBar: CustomAppBar(title: 'Ma\'lumotlar', actions: [
                IconButton(onPressed: (){
                  DynamicLinkProvider().createLink('sdsmdks3421').then((value) => Share.share('${state.mxikAndShtrixCodeResponse?.data.mxikInfo.mxikName}\n$value\nShtrix-kod: ${widget.code}'));
                }, icon: const Icon(Icons.share)
                ),
                AppUtils.kGap4,
              ],),
              body:Stack(
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
                            return ProductInfoPage(mxikAndShtrixCodeResponse: state.mxikAndShtrixCodeResponse, code: widget.code);
                          case 1:
                            return const ProductOwnerInfoPage();
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
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            // color: Colors.black12,
                              border: Border.all(
                                  color: Colors.black12,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ..._buildIndicator()
                            ],
                          )
                      ),
                    ),
                  ),
                ],
              ),
            );
          }else{
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(child: Text('Server xatoligi yoki noto\'g\'ri so\'rov',style:context.textStyle.regularTitle2.copyWith(color: Colors.red),textAlign: TextAlign.center,),),
              ),
            );
          }
        }

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
            index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
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
